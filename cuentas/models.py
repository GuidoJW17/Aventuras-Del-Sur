from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Perfil(models.Model):
    ADMIN = ("Admin")
    GUIA = ("Guia")
    TURISTA = ("Turista")

    ROLES = [
        (ADMIN, "Administrador"),
        (GUIA, "Guia/Operador"),
        (TURISTA, "Turista"),
    ]

    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name="perfil")
    rol = models.CharField(max_length=30, choices=ROLES, default=TURISTA)

    def __str__(self):
        return f"{self.usuario.username} {self.rol}"

    