from django.contrib import admin
from .models import Experiencia, Inscripcion, Categoria
# Register your models here.

@admin.register(Experiencia)
class ExperienciaAdmin(admin.ModelAdmin):
    list_display = ("titulo", "categoria", "creador", "precio", "cupo_maximo", "fecha_hora", "activa",)


@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ("nombre",)


@admin.register(Inscripcion)
class InscripcionAdmin(admin.ModelAdmin):
    list_display = ("usuario", "experiencia", "fecha_inscripcion", "estado_pago")
