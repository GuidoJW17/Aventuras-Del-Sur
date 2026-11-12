from django.contrib.auth.models import User
from django.db import models


class Categoria(models.Model):
    nombre = models.CharField(max_length=100, unique=True)
    descripcion = models.TextField(blank=True)

    def __str__(self):
        return self.nombre


class Experiencia(models.Model):
    titulo = models.CharField(max_length=200)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cupo_maximo = models.PositiveIntegerField()
    fecha_hora = models.DateTimeField()
    categoria = models.ForeignKey(Categoria, on_delete=models.PROTECT, related_name="experiencias")
    creador = models.ForeignKey(User, on_delete=models.CASCADE, related_name="experiencias_creadas")
    activa = models.BooleanField(default=True)

    class Meta:
        ordering = ["fecha_hora"]

    def __str__(self):
        return self.titulo


class Inscripcion(models.Model):
    PENDIENTE = "Pendiente"
    CONFIRMADO = "Confirmado"

    ESTADOS = [
        (PENDIENTE, "Pendiente"),
        (CONFIRMADO, "Confirmado"),
    ]

    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name="inscripciones")
    experiencia = models.ForeignKey(Experiencia, on_delete=models.CASCADE, related_name="inscripciones")
    fecha_inscripcion = models.DateTimeField(auto_now_add=True)
    estado_pago = models.CharField(max_length=10, choices=ESTADOS, default=PENDIENTE)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["usuario", "experiencia"],
                name="inscripcion_unica_por_usuario",
            )
        ]
        verbose_name = "Inscripción"
        verbose_name_plural = "Inscripciones"

    def __str__(self):
        return f"{self.usuario.username} -> {self.experiencia.titulo}"