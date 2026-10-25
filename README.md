# Instalador EXE para Extensiones pyRevit

Plantilla genérica para empaquetar extensiones de **pyRevit** en un instalador ejecutable (`.exe`) en español y con interfaz moderna, utilizando **Inno Setup** y **PowerShell**.

Despliega tus herramientas para Autodesk Revit copiando los archivos en `%APPDATA%\pyRevit\Extensions`, creando un acceso directo en el Menú Inicio y registrando la ruta en pyRevit de forma automática y sin permisos de administrador.

---

## Estructura del repositorio

```text
INSTALADOR/
├── MiExtension2.extension/    # Carpeta de tu extensión pyRevit
├── icono.ico                  # Icono del instalador, desinstalador y acceso directo (.ico)
├── instalador.iss             # Script de Inno Setup
├── registrar.ps1              # Script de registro automático en pyRevit
├── README.md
└── Output/                    # Carpeta donde se genera el .exe (ej. MiExtension_Setup.exe)
```

---

## ¿Cómo personalizarlo?

El archivo `instalador.iss` está completamente parametrizado. Para adaptarlo a tu propio proyecto o actualizar la versión, **solo necesitas editar las variables en las primeras líneas**:

| Variable / Parámetro | Valor actual | Qué hace |
| :--- | :--- | :--- |
| **`#define MyAppName`** | `"MiExtension"` | Define el nombre de la aplicación, del archivo `.exe` resultante (`MiExtension_Setup.exe`), del acceso directo y de los textos del asistente. |
| **`#define MyAppVersion`** | `"1.0.0"` | Versión actual de la extensión (cámbiala para publicar actualizaciones). |
| **`#define MyAppPublisher`** | `"MiEmpresa BIM"` | Nombre de tu empresa o autor que figurará en los detalles del instalador y en Windows. |
| **`#define MyExtension`** | `"MiExtension2.extension"` | Nombre exacto de la carpeta raíz de tu extensión pyRevit. |
| **`#define MyAppIcon`** | `"icono.ico"` | Nombre del archivo de icono que usará el instalador, el acceso directo del Menú Inicio y el Panel de Control al desinstalar. |

> **Nota:** El script copia automáticamente el archivo definido en `MyAppIcon` dentro de la carpeta de la extensión instalada para mantener los iconos vinculados correctamente en el sistema.
