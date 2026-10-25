# Instalador EXE para Extensiones pyRevit | OM-BIM

Plantilla para empaquetar extensiones de **pyRevit** en un instalador ejecutable (`.exe`) en español y con interfaz moderna, utilizando **Inno Setup** y **PowerShell**.

Despliega tus herramientas para Autodesk Revit copiando los archivos en `%APPDATA%\pyRevit\Extensions` y registrando la ruta mediante la CLI de pyRevit de forma automática y sin permisos de administrador.

---

## Estructura del repositorio

```text
INSTALADOR/
├── OM-BIM.extension/          # Carpeta de tu extensión pyRevit
├── OM-BIM.ico                 # Icono del instalador (.ico)
├── instalador.iss             # Script de Inno Setup
├── registrar.ps1              # Script de registro automático en pyRevit CLI
├── README.md
└── Output/                    # Carpeta donde se genera el .exe
```

---

## ¿Cómo personalizarlo?

El archivo `instalador.iss` está parametrizado. Para adaptarlo a otro proyecto o actualizar la versión, **solo necesitas editar las primeras líneas**:

| Variable / Parámetro | Valor actual | Qué hace |
| :--- | :--- | :--- |
| **`#define MyAppName`** | `"OM-BIM"` | Define el nombre de la app, del `.exe`, del icono y de los textos del asistente. |
| **`#define MyAppVersion`** | `"1.0.0"` | Versión actual (cámbiala para publicar actualizaciones). |
| **`#define MyExtension`** | `"OM-BIM.extension"` | Nombre exacto de la carpeta de tu extensión. |
| **`AppId`** | `{{B8D40A19...}` | Identificador único. Genera uno nuevo en Inno Setup (*Tools > Generate GUID*) si creas un producto distinto. |

> **Nota:** Asegúrate de que tu archivo `.ico` se llame igual que `MyAppName` (ej. `OM-BIM.ico`) o ajusta la línea `SetupIconFile`.

---
