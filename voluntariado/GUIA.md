# Documento Guía para Voluntarios

## Preparación

 - Traer TODOS los pinchos USB que tengais disponibles.
 - Tener un Ventoy con las 4 distros Y pinchos con las ISOs quemadas directamente (a veces Ventoy no funciona en algunos hardwares)
 - Traer vuestro portatil para leer este documento, buscar problemas en la web y quemar mas pinchos
 - Traer **MUCHA** paciencia

## Reducir partición de Windows

En caso de que se quiera conservar windows

1. Desactivar inicio rapido `powercfg /h off`
2. Click derecho inicio -> Administrador de Discos
3. Click derecho partición C: -> Reducir
4. Comprobar que se puede reducir, al menos 50GB
5. Reducir, esperar

### Si no se puede reducir al menos 50GB

 - Comprobar espacio libre (eliminar cosas si hace falta, WinDirStat)
 - Desactivar hibernación y inicio rapido si se te ha olvidado `powercfg /h off`
 - Desactivar 'memoria virtual'
 - Desactivar bitlocker (comprobar con `manage-bde -status C:` == 0.0%), descifrar `manage-bde -off C:`
 - Desfragmentar `defrag C: /X /U /V`

#### Identificar causa

1. Abrir dialogo de reducción de volumen
2. Abrir visor de eventos -> registros de windows -> aplicación
3. Último evento `Microsoft-Windows-Defrag` `defrag`
4. Mirar causa

##### Si es `pagefile.sys`

 - Win + r`sysdm.cpl` -> opciones avanzadas -> rendimiento -> configuración -> opciones avanzadas -> memoria virtual -> cambiar -> { desmarcar automatico, seleccionar C:, elegir sin archivo de paginación } -> establecer -> reiniciar

##### Si es `$Mft::$BITMAP` o `$Bitmap`

1. `chkdsk C: /f`, si pide reiniciar hacerlo
2. `shutdown /s /t 0`

#### Alternativa si todo fallase 'atpc'

1. Arrancar USB con GParted Live
2. Resize/Move partición de Windows borde derecho
3. Aplicar

## Crear medios de instalación

 1. Descargar ISO del [Servidor de ISOs](http://install-party.local/isos)
 2. Descargar [Rufus](https://rufus.ie/en/) o en Linux, usar `dd`
 3. Quemar ISO en el pincho enchufado (rufus default, `dd if=archivo.iso of=/dev/sdloquesea bs=4k status=progress`)

## Arrancar instalador

### Si no tiene ethernet

 - Enchufar pincho, arrancar y seguir dialogos

### Si tiene ethernet

 - Conectar al switch, seleccionar network boot, PXE o PCI network card
 - Seleccionar distro en el menu iPXE
 - Seguir dialogo

## Instalar

 - Cuando se llegue a particionado, crear nueva partición para /, seleccionar la EFI y si eso un swap
 - Cuando configureis apt o dnf, poner de repo `http://install-party.local/{debian, ubuntu, mint, fedora}/`
 - Completar instalación
 - Comprobar que GRUB detecta Windows (si se decide conservar windows)

### Si no aparece entrada en la UEFI

Comando sustituir Windows Boot Manager por Grub en EFI (para que aparezca en bios) desde Windows CMD como admin (NO powershell): 

`bcdedit /set "{bootmgr}" path \EFI\debian\shimx64.efi` (revisar ruta por instalación (not debian))

 - ver estructura de ficheros desde linux y sustituir "debian" según convenga (está en /boot/efi/)
 - sustituir "shimx64.efi" por "grubx64.efi" si secure boot está desactivado

## Instalar software del curso

 - `curl http://install-party.local/scripts/{debian-trixie.sh, fedora-45.sh, mint-22.sh, ubuntu-resolute.sh} | bash`

## En caso de MacOS

 - Instalar VirtualBox y VM de lo que sea, y echarles la charla de macos

