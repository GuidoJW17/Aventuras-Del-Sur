from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin

from .models import Perfil

#solo pasan admins y guias
class AdminRequeridoMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return self.request.user.perfil.rol == Perfil.ADMIN

class GuiaOAdminMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return self.request.user.perfil.rol in (Perfil.GUIA, Perfil.ADMIN)