from django.urls import path
from . import views

urlpatterns = [
    #categoria url
    path("categorias/", views.CategoriaLista.as_view(), name="categoria_lista"),
    path("categorias/nueva/", views.CategoriaCrear.as_view(), name="categoria_crear"),
    path("categorias/<int:pk>/editar/", views.CategoriaEditar.as_view(), name="categoria_editar"),
    path("categorias/<int:pk>/eliminar/", views.CategoriaEliminar.as_view(), name="categoria_eliminar"),

    #experiencia url
    path("experiencias/", views.ExperienciaLista.as_view(), name="experiencia_lista"),
    path("experiencias/nueva/", views.ExperienciaCrear.as_view(), name="experiencia_crear"),
    path("experiencias/<int:pk>/editar/", views.ExperienciaEditar.as_view(), name="experiencia_editar"),
    path("experiencias/<int:pk>/eliminar/", views.ExperienciaEliminar.as_view(), name="experiencia_eliminar"),
    path("catalogo/", views.ExperienciaCatalogo.as_view(), name="experiencia_catalogo"),

    #reservas url
    path("mis-reservas/", views.MisReservas.as_view(), name="mis_reservas"),
    path("reservas/", views.ReservaLista.as_view(), name="reserva_lista"),
    path("reservas/<int:pk>/editar/", views.ReservaEditar.as_view(), name="reserva_editar"),
    path("reservas/<int:pk>/eliminar/", views.ReservaEliminar.as_view(), name="reserva_eliminar"),
    path("experiencias/<int:pk>/inscribirse/", views.InscribirseView.as_view(), name="inscribirse")
]