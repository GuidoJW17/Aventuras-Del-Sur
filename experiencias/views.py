
from django.contrib import messages
from django.db.models import ProtectedError
from django.shortcuts import redirect, get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import CreateView, DeleteView, ListView, UpdateView
from cuentas.mixins import AdminRequeridoMixin, GuiaOAdminMixin
from cuentas.models import Perfil
from .forms import CategoriaForm, ExperienciaForm
from .models import Categoria, Experiencia, Inscripcion
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import View

# Create your views here.

#CRUD categorias
class CategoriaLista(AdminRequeridoMixin, ListView):
    model = Categoria
    template_name = "categorias/lista.html"
    context_object_name = "categorias"

class CategoriaCrear(AdminRequeridoMixin, CreateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = "categorias/form.html"
    success_url = reverse_lazy("categoria_lista")
    extra_context = {"titulo": "Nueva categoría"}


class CategoriaEditar(AdminRequeridoMixin, UpdateView):
    model = Categoria
    form_class = CategoriaForm
    template_name = "categorias/form.html"
    success_url = reverse_lazy("categoria_lista")
    extra_context = {"titulo": "Editar categoría"}


class CategoriaEliminar(AdminRequeridoMixin, DeleteView):
    model = Categoria
    template_name = "categorias/confirmar_eliminar.html"
    success_url = reverse_lazy("categoria_lista")

    def form_valid(self, form):
        try:
            return super().form_valid(form)
        except ProtectedError:
            messages.error(
                self.request,
                "No se puede eliminar: la categoría tiene experiencias asociadas.",
            )
            return redirect("categoria_lista")


#crud experiencias
class ExperienciaLista(GuiaOAdminMixin, ListView):
    model = Experiencia
    template_name = "experiencias/lista.html"
    context_object_name = "experiencias"

    def get_queryset(self):
        if self.request.user.perfil.rol == Perfil.ADMIN:
            return Experiencia.objects.all()
        return Experiencia.objects.filter(creador=self.request.user)



class ExperienciaCrear(GuiaOAdminMixin, CreateView):
    model = Experiencia
    form_class = ExperienciaForm
    template_name = "experiencias/form.html"
    success_url = reverse_lazy("experiencia_lista")
    extra_context = {"titulo": "Nueva experiencia"}

    def form_valid(self, form):
        form.instance.creador = self.request.user
        return super().form_valid(form)

class ExperienciaEditar(GuiaOAdminMixin, UpdateView):
    model = Experiencia
    form_class = ExperienciaForm
    template_name = "experiencias/form.html"
    success_url = reverse_lazy("experiencia_lista")
    extra_context = {"titulo": "Editar experiencia"}

    def get_queryset(self):
        if self.request.user.perfil.rol == Perfil.ADMIN:
            return Experiencia.objects.all()
        return Experiencia.objects.filter(creador=self.request.user)


class ExperienciaEliminar(AdminRequeridoMixin, DeleteView):
    model = Experiencia
    template_name = "experiencias/confirmar_eliminar.html"
    success_url = reverse_lazy("experiencia_lista")


class ExperienciaCatalogo(ListView):
    model = Experiencia
    template_name = "experiencias/catalogo.html"
    context_object_name = "experiencias"

    def get_queryset(self):
        return Experiencia.objects.filter(activa=True)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.user.is_authenticated:
            context["inscritas"] = set(
                Inscripcion.objects.filter(usuario=self.request.user)
                .values_list("experiencia_id", flat=True)
            )
        else:
            context["inscritas"] = set()
        return context

#verificar el rol, la inscripcion si se repitio ono y el cupo
class InscribirseView(LoginRequiredMixin, View):
    def post(self, request, pk):
        experiencia = get_object_or_404(Experiencia, pk=pk, activa=True)

        if request.user.perfil.rol not in (Perfil.TURISTA, Perfil.ADMIN):
            messages.error(request, "Solo los turistas pueden inscribirse en experiencias.")
            return redirect("experiencia_catalogo")

        if Inscripcion.objects.filter(usuario=request.user, experiencia=experiencia).exists():
            messages.warning(request, "Ya estás inscrito en esta experiencia.")
            return redirect("experiencia_catalogo")

        if experiencia.inscripciones.count() >= experiencia.cupo_maximo:
            messages.error(request, "No hay cupo disponible para esta experiencia.")
            return redirect("experiencia_catalogo")

        Inscripcion.objects.create(usuario=request.user, experiencia=experiencia)
        messages.success(request, "Inscripción realizada correctamente.")
        return redirect("mis_reservas")


#crud reservas
class MisReservas(LoginRequiredMixin, ListView):
    model = Inscripcion
    template_name = "reservas/mis_reservas.html"
    context_object_name = "reservas"

    def get_queryset(self):
        return Inscripcion.objects.filter(usuario=self.request.user).select_related("experiencia")

class ReservaLista(AdminRequeridoMixin, ListView):
    model = Inscripcion
    template_name = "reservas/lista.html"
    context_object_name = "reservas"

    def get_queryset(self):
        return Inscripcion.objects.select_related("usuario", "experiencia")


class ReservaEditar(AdminRequeridoMixin, UpdateView):
    model = Inscripcion
    fields = ["estado_pago"]
    template_name = "reservas/form.html"
    success_url = reverse_lazy("reserva_lista")


class ReservaEliminar(LoginRequiredMixin, DeleteView):
    model = Inscripcion
    template_name = "reservas/confirmar_eliminar.html"

    def get_queryset(self):
        if self.request.user.perfil.rol == Perfil.ADMIN:
            return Inscripcion.objects.all()
        return Inscripcion.objects.filter(usuario=self.request.user)

    def get_success_url(self):
        if self.request.user.perfil.rol == Perfil.ADMIN:
            return reverse_lazy("reserva_lista")
        return reverse_lazy("mis_reservas")