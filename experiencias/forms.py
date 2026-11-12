from django import forms

from .models import Categoria, Experiencia

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ["nombre", "descripcion"]

class ExperienciaForm(forms.ModelForm):
    class Meta:
        model = Experiencia
        fields = [
            "titulo",
            "descripcion",
            "precio",
            "cupo_maximo",
            "fecha_hora",
            "categoria",
            "activa"
        ]