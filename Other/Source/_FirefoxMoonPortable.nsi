; NSIS with Registry.nsh in Include and Registry.dll, FindProcDLL.dll, KillProcDLL.dll and SimpleSC.dll in Plugins

; **************************************************************************
; === Define constants ===
; **************************************************************************
!define VER "0.0.0.0"
!define APPNAME "Firefox Moon"
!define APP "FirefoxMoon"
!define APPDIR "App\FirefoxMoon"
!define APPEXE "firefoxmoon.exe"

;--- Define RegKeys ---
	!define REGKEYVALUE1 "HKEY_CLASSES_ROOT\mailto\shell\open\command"
	!define REGVALUE1 ""

; **************************************************************************
; === Best Compression ===
; **************************************************************************
SetCompressor /SOLID lzma
SetCompressorDictSize 32

; **************************************************************************
; === Includes ===
; **************************************************************************
!include "..\_Include\Launcher.nsh" 
!include "LogicLib.nsh"
!include "x64.nsh"
!include "FileFunc.nsh"

; **************************************************************************
; === Set basic information ===
; **************************************************************************
Name "${APPNAME} Portable"
OutFile "..\..\..\FirefoxPortable_x64\${APP}Portable.exe"
Icon "${APP}.ico"

; **************************************************************************
; === Other Actions ===
; **************************************************************************
Var PARENTDIR
Var USER
Var THUNDERBIRDUSER

Function MultiUser
ReadINIStr $USER "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "User"
StrCmp $USER "" 0 +3
WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "User" "${APP}"
StrCpy $USER "${APP}"
IfFileExists "$EXEDIR\Data\$USER\*.*" +3
CreateDirectory "$EXEDIR\Data\$USER"
CopyFiles /SILENT  "$EXEDIR\App\DefaultData\${APP}Profile\*.*" "$EXEDIR\Data\$USER"
FunctionEnd

Function Init
	${GetParent} "$EXEDIR" "$PARENTDIR"
${If} ${RunningX64}
${AndIf} ${FileExists} "$PARENTDIR\CommonFiles\Java_64\bin\plugin2\npjp2.dll"
	System::Call 'Kernel32::SetEnvironmentVariableA(t, t) i("MOZ_PLUGIN_PATH", "$EXEDIR\Data\Plugins;$PARENTDIR\CommonFiles\Plugins;$PARENTDIR\CommonFiles\Java_64\bin\plugin2").r0'
${Else}
	System::Call 'Kernel32::SetEnvironmentVariableA(t, t) i("MOZ_PLUGIN_PATH", "$EXEDIR\Data\Plugins;$PARENTDIR\CommonFiles\Plugins;$PARENTDIR\CommonFiles\Java\bin\plugin2").r0'
${EndIf}

	nsisFirewall::AddAuthorizedApplication "$EXEDIR\${APPDIR}\${APPEXE}" "${APPNAME} Portable"
FunctionEnd

Function CheckInit
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "ThunderbirdAssociate"
	StrCmp $0 "false" CheckInitEnd
	WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "ThunderbirdAssociate" "true"
	IfFileExists "$PARENTDIR\ThunderbirdPortable\App\Thunderbird\thunderbird.exe" RegThunder
	Goto CheckInitEnd
RegThunder:
	${registry::BackupValue} "${REGKEYVALUE1}" "${REGVALUE1}"
	Sleep 50
	${registry::Unload}
ReadINIStr $THUNDERBIRDUSER "$PARENTDIR\ThunderbirdPortable\ThunderbirdPortable.ini" "ThunderbirdPortable" "User"
	WriteRegStr HKEY_CLASSES_ROOT "mailto\shell\open\command" "" `"$PARENTDIR\ThunderbirdPortable\App\Thunderbird\thunderbird.exe" -profile "$PARENTDIR\ThunderbirdPortable\Data\$THUNDERBIRDUSER" -compose "%1"`
CheckInitEnd:
FunctionEnd

;**********************************************************
Function Close
	nsisFirewall::RemoveAuthorizedApplication "$EXEDIR\${APPDIR}\${APPEXE}"
FunctionEnd

Function CheckClose
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "ThunderbirdAssociate"
	StrCmp $0 "false" CheckCloseEnd
	IfFileExists "$PARENTDIR\ThunderbirdPortable\App\Thunderbird\thunderbird.exe" UnRegThunder
	Goto CheckCloseEnd
UnRegThunder:
	${registry::RestoreBackupValue} "${REGKEYVALUE1}" "${REGVALUE1}"
	Sleep 50
	${registry::Unload}
CheckCloseEnd:
FunctionEnd

; **************************************************************************
; === Run Application ===
; **************************************************************************
Function Launch
${GetParameters} $0
${If} ${RunningX64}
${AndIf} ${FileExists} "$EXEDIR\${APPDIR}_64\${APPEXE}"
SetOutPath "$EXEDIR\${APPDIR}_64"
ExecWait `"$EXEDIR\${APPDIR}_64\${APPEXE}" -profile "$EXEDIR\Data\$USER" $0`
${Else}
SetOutPath "$EXEDIR\${APPDIR}"
ExecWait `"$EXEDIR\${APPDIR}\${APPEXE}" -profile "$EXEDIR\Data\$USER" $0`
${EndIf}
WriteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "GoodExit" "true"
newadvsplash::stop
FunctionEnd

; **************************************************************************
; ==== Running ====
; **************************************************************************

Section "Main"

	Call MultiUser
	Call CheckRegWrite
	Call CheckRunExe
	Call CheckGoodExit

	Call Init
	Call CheckInit
	
		Call SplashLogo
		Call Launch

	Call Restore

SectionEnd

Function Restore

	Call Close
	Call CheckClose

FunctionEnd

