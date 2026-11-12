# Aventuras del Sur

Sistema de gestión de experiencias turísticas desarrollado con Django y MySQL para la Evaluación 3 de Back End.

## Funcionalidades

- Autenticación con roles: Administrador, Guía/Operador y Turista.
- CRUD de categorías (solo Administrador).
- CRUD de experiencias con permisos por rol.
- Catálogo público de experiencias activas.
- Inscripción de turistas con control de cupo y reserva única.
- Gestión de reservas y estado de pago.
- Interfaz basada en SB Admin 2 y DataTables.

## Roles

| Rol | Permisos |
|---|---|
| Administrador | Gestiona usuarios, categorías, experiencias y reservas. |
| Guía/Operador | Crea, ve y edita solo sus propias experiencias. No puede eliminarlas ni gestionar categorías. |
| Turista | Ve las experiencias activas y gestiona sus propias reservas. |

## Requisitos

- Python 3.14
- MySQL 8
- Django 6

## Instalación

1. Crear la base de datos `inventarioAventura_db` en MySQL.
2. Instalar las dependencias:

```powershell
pip install django pymysql
```

3. Configurar la conexión en `inventarioAventura/settings.py`.
4. Aplicar las migraciones:

```powershell
python manage.py migrate
```

5. Ejecutar el servidor:

```powershell
python manage.py runserver
```

## Base de datos

El respaldo se encuentra en `backups/backup_inventarioAventura_db.sql`.

Para restaurarlo:

```powershell
cmd /c "\"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe\" -u root -p < backups\backup_inventarioAventura_db.sql"
```

## Estructura

```
inventarioAventura/
├── core/               # Panel principal
├── cuentas/            # Perfiles, roles y mixins de permisos
├── experiencias/       # Categorías, experiencias y reservas
├── inventarioAventura/ # Configuración del proyecto
├── static/             # CSS
├── templates/          # Plantillas HTML
└── backups/            # Respaldo de MySQL
```
