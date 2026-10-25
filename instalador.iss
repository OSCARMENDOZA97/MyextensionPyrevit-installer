; CONFIGURACIÓN GENERAL (Modifica estos valores a tu medida)

#define MyAppName "MiExtension"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "MiEmpresa BIM"
#define MyExtension "MiExtension2.extension"
#define MyAppIcon "icono.ico"

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}

DefaultDirName={userappdata}\pyRevit\Extensions
DefaultGroupName={#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest

SetupIconFile={#MyAppIcon}
OutputDir=Output
OutputBaseFilename={#MyAppName}_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

UninstallDisplayName={#MyAppName} (pyRevit)
UninstallDisplayIcon={app}\{#MyExtension}\{#MyAppIcon}

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
Source: "{#MyExtension}\*"; DestDir: "{app}\{#MyExtension}"; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#MyAppIcon}"; DestDir: "{app}\{#MyExtension}"; Flags: ignoreversion
Source: "registrar.ps1"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Run]
Filename: "{sys}\WindowsPowerShell\v1.0\powershell.exe"; \
  Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{tmp}\registrar.ps1"" ""{app}"""; \
  Flags: runhidden waituntilterminated; \
  StatusMsg: "Configurando la ruta de {#MyAppName} en pyRevit..."

[Icons]
Name: "{group}\Carpeta {#MyAppName}"; Filename: "{app}\{#MyExtension}"; IconFilename: "{app}\{#MyExtension}\{#MyAppIcon}"

[Code]
function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result :=
    '{#MyAppName} v{#MyAppVersion} | EXTENSIÓN PARA AUTODESK REVIT' + NewLine +
    '========================================' + NewLine + NewLine +
    'UBICACIÓN DE INSTALACIÓN:' + NewLine +
    Space + ExpandConstant('{app}\{#MyExtension}') + NewLine + NewLine +
    'ACCIONES:' + NewLine +
    Space + '1. Copiar archivos de la extensión.' + NewLine +
    Space + '2. Registrar ruta automáticamente en pyRevit (%APPDATA%).' + NewLine +
    Space + '3. Crear acceso directo en el Menú Inicio.' + NewLine + NewLine +
    'IMPORTANTE:' + NewLine +
    Space + '- Mantenga Autodesk Revit cerrado durante la instalación.' + NewLine +
    Space + '- Requiere tener pyRevit previamente instalado.' + NewLine + NewLine +
    'Presione Instalar para continuar.';
end;