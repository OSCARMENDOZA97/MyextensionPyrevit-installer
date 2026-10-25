
param(
    [string]$RutaExtensiones
)

$ErrorActionPreference = "Stop"

try {
    $cli = Get-Command pyrevit -ErrorAction Stop

    & $cli.Source extensions paths add $RutaExtensiones

    if ($LASTEXITCODE -ne 0) {
        throw "No se pudo registrar la ruta."
    }

    Write-Host "Extension registrada correctamente."
}
catch {
    $mensaje = @"
La extension se copio, pero no se pudo
registrar automaticamente en pyRevit.

Abra pyRevit Settings y agregue esta
ruta en Custom Extension Directories:

$RutaExtensiones
"@

    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show(
        $mensaje,
        "Configuracion de pyRevit"
    )
}
