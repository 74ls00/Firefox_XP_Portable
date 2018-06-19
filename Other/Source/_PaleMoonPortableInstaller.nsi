/*
http://relmirror.palemoon.org/release/palemoon-25.0.1.win32.installer.exe
http://relmirror.palemoon.org/release/palemoon-25.0.1.win64.installer.exe
http://relmirror.palemoon.org/release/palemoon-25.0.0.win32.installer.exe
http://relmirror.palemoon.org/release/palemoon-25.0.0.win64.installer.exe
http://www.palemoon.org/langpacks.shtml
http://relmirror.palemoon.org/langpacks/25.x/fr.xpi
*/
!define RELEASURL	"http://relmirror.palemoon.org/release"
!define APPSIZE	"45600" # kB
!define LANGPACKURL	"http://relmirror.palemoon.org/langpacks"
!define DLVER	"25.x"
!define LANGVER	"25.x"
!define APPVER 	"0.0.0.0"
!define APPNAME "Pale Moon"
!define APP 	"PaleMoon"
!define DLNAME	"Pale_Moon"
!define APPLANG	"32-64_bit_Multilingual-Online"
!define FOLDER	"FirefoxPortable"
!define OPTIONS
!define FINISHRUN
!define MULTILANG
!define INPUTBOX
!define SOURCES

SetCompressor /SOLID lzma
SetCompressorDictSize 32

!include "..\_Include\Installer.nsh"
!include "LogicLib.nsh"
!include "x64.nsh"

;=== Languages
!insertmacro MUI_LANGUAGE "Afrikaans"
!insertmacro MUI_LANGUAGE "Arabic"
!insertmacro MUI_LANGUAGE "Belarusian"
!insertmacro MUI_LANGUAGE "Bulgarian"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Greek"
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SpanishInternational"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "Basque"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "Irish"
!insertmacro MUI_LANGUAGE "Hebrew"
!insertmacro MUI_LANGUAGE "Hungarian"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Korean"
!insertmacro MUI_LANGUAGE "Kurdish"
!insertmacro MUI_LANGUAGE "Lithuanian"
!insertmacro MUI_LANGUAGE "Macedonian"
!insertmacro MUI_LANGUAGE "Mongolian"
!insertmacro MUI_LANGUAGE "Norwegian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "NorwegianNynorsk"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "Romanian"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Slovak"
!insertmacro MUI_LANGUAGE "Slovenian"
!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Ukrainian"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"

; --- Delete if no InputBox

Var InputVer
Var VER
Function nsDialogsPage
	nsDialogs::Create 1018
	Pop $0
	${NSD_CreateLabel} 0 0 100% 12u "Enter Version Number:"
	Pop $0
	${NSD_CreateText} 0 13u 100% 12u ""
	Pop $InputVer
	nsDialogs::Show
FunctionEnd
Function nsDialogsPageLeave
	${NSD_GetText} $InputVer $R0
StrCmp $R0 "" 0 +3
	MessageBox MB_ICONEXCLAMATION `You must enter a version number!`
Abort
	StrCpy $VER "$R0"
FunctionEnd

Var LNG
Section "${APP} Portable 32 bit" main
SectionIn RO

StrCmp $LANGUAGE ${LANG_AFRIKAANS} 0 +2
StrCpy $LNG "af"
StrCmp $LANGUAGE ${LANG_ARABIC} 0 +2
StrCpy $LNG "ar"
StrCmp $LANGUAGE ${LANG_BELARUSIAN} 0 +2
StrCpy $LNG "be"
StrCmp $LANGUAGE ${LANG_BULGARIAN} 0 +2
StrCpy $LNG "bg"
StrCmp $LANGUAGE ${LANG_CATALAN} 0 +2
StrCpy $LNG "ca"
StrCmp $LANGUAGE ${LANG_CZECH} 0 +2
StrCpy $LNG "cs"
StrCmp $LANGUAGE ${LANG_DANISH} 0 +2
StrCpy $LNG "da"
StrCmp $LANGUAGE ${LANG_GERMAN} 0 +2
StrCpy $LNG "de"
StrCmp $LANGUAGE ${LANG_GREEK} 0 +2
StrCpy $LNG "el"
StrCmp $LANGUAGE ${LANG_ENGLISH} 0 +2
StrCpy $LNG "en-US"
StrCmp $LANGUAGE ${LANG_SPANISHINTERNATIONAL} 0 +2
StrCpy $LNG "es-AR"
StrCmp $LANGUAGE ${LANG_SPANISH} 0 +2
StrCpy $LNG "es-ES"
StrCmp $LANGUAGE ${LANG_BASQUE} 0 +2
StrCpy $LNG "eu"
StrCmp $LANGUAGE ${LANG_FINNISH} 0 +2
StrCpy $LNG "fi"
StrCmp $LANGUAGE ${LANG_FRENCH} 0 +2
StrCpy $LNG "fr"
StrCmp $LANGUAGE ${LANG_IRISH} 0 +2
StrCpy $LNG "ga-IE"
StrCmp $LANGUAGE ${LANG_HEBREW} 0 +2
StrCpy $LNG "he"
StrCmp $LANGUAGE ${LANG_HUNGARIAN} 0 +2
StrCpy $LNG "hu"
StrCmp $LANGUAGE ${LANG_ITALIAN} 0 +2
StrCpy $LNG "it"
StrCmp $LANGUAGE ${LANG_JAPANESE} 0 +2
StrCpy $LNG "ja"
StrCmp $LANGUAGE ${LANG_KOREAN} 0 +2
StrCpy $LNG "ko"
StrCmp $LANGUAGE ${LANG_KURDISH} 0 +2
StrCpy $LNG "ku"
StrCmp $LANGUAGE ${LANG_LITHUANIAN} 0 +2
StrCpy $LNG "lt"
StrCmp $LANGUAGE ${LANG_MACEDONIAN} 0 +2
StrCpy $LNG "mk"
StrCmp $LANGUAGE ${LANG_MONGOLIAN} 0 +2
StrCpy $LNG "mn"
StrCmp $LANGUAGE ${LANG_NORWEGIAN} 0 +2
StrCpy $LNG "nb-NO"
StrCmp $LANGUAGE ${LANG_DUTCH} 0 +2
StrCpy $LNG "nl"
StrCmp $LANGUAGE ${LANG_NORWEGIANNYNORSK} 0 +2
StrCpy $LNG "nn-NO"
StrCmp $LANGUAGE ${LANG_POLISH} 0 +2
StrCpy $LNG "pl"
StrCmp $LANGUAGE ${LANG_PORTUGUESEBR} 0 +2
StrCpy $LNG "pt-BR"
StrCmp $LANGUAGE ${LANG_PORTUGUESE} 0 +2
StrCpy $LNG "pt-PT"
StrCmp $LANGUAGE ${LANG_ROMANIAN} 0 +2
StrCpy $LNG "ro"
StrCmp $LANGUAGE ${LANG_RUSSIAN} 0 +2
StrCpy $LNG "ru"
StrCmp $LANGUAGE ${LANG_SLOVAK} 0 +2
StrCpy $LNG "sk"
StrCmp $LANGUAGE ${LANG_SLOVENIAN} 0 +2
StrCpy $LNG "sl"
StrCmp $LANGUAGE ${LANG_SWEDISH} 0 +2
StrCpy $LNG "sv-SE"
StrCmp $LANGUAGE ${LANG_TURKISH} 0 +2
StrCpy $LNG "tr"
StrCmp $LANGUAGE ${LANG_UKRAINIAN} 0 +2
StrCpy $LNG "uk"
StrCmp $LANGUAGE ${LANG_SIMPCHINESE} 0 +2
StrCpy $LNG "zh-CN"
StrCmp $LANGUAGE ${LANG_TRADCHINESE} 0 +2
StrCpy $LNG "zh-TW"

;Download en-US
	RMDir "/r" "$TEMP\${APP}PortableTemp"
	CreateDirectory "$TEMP\${APP}PortableTemp"
	Dialer::GetConnectedState
	Pop $0
StrCmp $0 "online" +3
	MessageBox MB_USERICON "You are $0: you can't download Setup to extract files!"
	Abort
	inetc::get  "${RELEASURL}/palemoon-$VER.win32.installer.exe" "$TEMP\${APP}PortableTemp\palemoon-$VER.win32.installer.exe" /END
	Pop $0 # return value = exit code, "OK" if OK
StrCmp $0 "OK" +3
	MessageBox MB_USERICON "Download of palemoon-$VER.win32.installer.exe: $0"
	Abort
	SetOutPath "$INSTDIR"
		File "..\..\..\${FOLDER}\${APP}Portable.exe"
	File "/oname=$TEMP\${APP}PortableTemp\7za.exe" "..\_Include\7-Zip\7za.exe"
DetailPrint "Installing ${APPNAME} Portable"
	nsExec::Exec `"$TEMP\${APP}PortableTemp\7za.exe" x "$TEMP\${APP}PortableTemp\palemoon-$VER.win32.installer.exe" -o"$TEMP\${APP}PortableTemp\Temp"`
	SetOutPath "$INSTDIR\App\${APP}"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp\nonlocalized\*.*" "$INSTDIR\App\${APP}\"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp\localized\*.*" "$INSTDIR\App\${APP}\"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp\optional\*.*" "$INSTDIR\App\${APP}\"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp\core\*.*" "$INSTDIR\App\${APP}\"
	SetOutPath "$INSTDIR\App\DefaultData\${APP}Profile"
	File "prefs.js"
	File "bookmarks.html"
	ReadINIStr $1 "$INSTDIR\App\${APP}\application.ini" "App" "Version"
	ReadINIStr $2 "$INSTDIR\App\${APP}\application.ini" "Gecko" "MinVersion"
ClearErrors
FileOpen $0 "$INSTDIR\App\DefaultData\${APP}Profile\prefs.js" a
IfErrors done
FileSeek $0 0 END
FileWrite $0 `user_pref("extensions.lastAppVersion", "$1");`
FileWriteByte $0 "13"
FileWriteByte $0 "10"
FileWrite $0 `user_pref("browser.startup.homepage_override.mstone", "rv:$2");`
FileWriteByte $0 "13"
FileWriteByte $0 "10"
FileClose $0
done:

StrCmp $LNG "en-US" donelang

	inetc::get  "${LANGPACKURL}/${LANGVER}/$LNG.xpi" "$TEMP\${APP}PortableTemp\$LNG.xpi" /END
	Pop $0
StrCmp $0 "OK" +3
	MessageBox MB_USERICON "Download of $LNG.xpi: $0"
Goto donelang
DetailPrint "Installing ${APPNAME} Portable"

	SetOutPath "$INSTDIR\App\DefaultData\${APP}Profile\extensions"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\$LNG.xpi" "$INSTDIR\App\DefaultData\${APP}Profile\extensions"
	Delete "$INSTDIR\App\DefaultData\${APP}Profile\extensions\langpack-$LNG@palemoon.org.xpi"
	Rename "$INSTDIR\App\DefaultData\${APP}Profile\extensions\$LNG.xpi" "$INSTDIR\App\DefaultData\${APP}Profile\extensions\langpack-$LNG@palemoon.org.xpi"
ClearErrors
FileOpen $0 "$INSTDIR\App\DefaultData\${APP}Profile\prefs.js" a
IfErrors donelang
FileSeek $0 0 END
FileWrite $0 `user_pref("general.useragent.locale", "$LNG");`
FileWriteByte $0 "13"
FileWriteByte $0 "10"
; FileWrite $0 `user_pref("extensions.enabledAddons", "langpack-$LNG@palemoon.org");`
; FileWriteByte $0 "13"
; FileWriteByte $0 "10"
FileClose $0
donelang:

!ifdef SOURCES
Call Sources
	SetOutPath "$INSTDIR\Other\_Include\7-Zip"
	File "..\_Include\7-Zip\7za.exe"
	SetOutPath "$INSTDIR\Other\Source"
	File "prefs.js"
!endif

SectionEnd

Section /o "${APP} Portable 64 bit" x64
	inetc::get  "${RELEASURL}/palemoon-$VER.win64.installer.exe" "$TEMP\${APP}PortableTemp\palemoon-$VER.win64.installer.exe" /END
	Pop $0
StrCmp $0 "OK" +3
	MessageBox MB_USERICON "Download of palemoon-$VER.win64.installer.exe: $0"
	Abort
DetailPrint "Installing ${APPNAME} Portable 64 bit"
	nsExec::Exec `"$TEMP\${APP}PortableTemp\7za.exe" x "$TEMP\${APP}PortableTemp\palemoon-$VER.win64.installer.exe" -o"$TEMP\${APP}PortableTemp\Temp64"`
	SetOutPath "$INSTDIR\App\${APP}_64"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp64\nonlocalized\*.*" "$INSTDIR\App\${APP}_64\"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp64\localized\*.*" "$INSTDIR\App\${APP}_64\"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp64\optional\*.*" "$INSTDIR\App\${APP}_64\"
	CopyFiles /SILENT "$TEMP\${APP}PortableTemp\Temp64\core\*.*" "$INSTDIR\App\${APP}_64\"

	; SetOutPath "$INSTDIR\App\${APP}_64\extensions"
	; CopyFiles /SILENT "$TEMP\${APP}PortableTemp\$LNG.xpi" "$INSTDIR\App\${APP}_64\extensions"
	; Delete "$INSTDIR\App\${APP}_64\extensions\langpack-$LNG@palemoon.org.xpi"
	; Rename "$INSTDIR\App\${APP}_64\extensions\$LNG.xpi" "$INSTDIR\App\${APP}_64\extensions\langpack-$LNG@palemoon.org.xpi"
SectionEnd

Function .onGUIEnd
	RMDir "/r" "$TEMP\${APP}PortableTemp"
FunctionEnd

Function MultiLang
Push ""
Push ${LANG_AFRIKAANS}
Push Afrikaans
Push ${LANG_ARABIC}
Push Arabic
Push ${LANG_BELARUSIAN}
Push Belarusian
Push ${LANG_BULGARIAN}
Push Bulgarian
Push ${LANG_CATALAN}
Push Catalan
Push ${LANG_CZECH}
Push Czech
Push ${LANG_DANISH}
Push Danish
Push ${LANG_GERMAN}
Push German
Push ${LANG_GREEK}
Push Greek
Push ${LANG_ENGLISH}
Push English
Push ${LANG_SPANISHINTERNATIONAL}
Push SpanishInternational
Push ${LANG_SPANISH}
Push Spanish
Push ${LANG_BASQUE}
Push Basque
Push ${LANG_FINNISH}
Push Finnish
Push ${LANG_FRENCH}
Push French
Push ${LANG_IRISH}
Push Irish
Push ${LANG_HEBREW}
Push Hebrew
Push ${LANG_HUNGARIAN}
Push Hungarian
Push ${LANG_ITALIAN}
Push Italian
Push ${LANG_JAPANESE}
Push Japanese
Push ${LANG_KOREAN}
Push Korean
Push ${LANG_KURDISH}
Push Kurdish
Push ${LANG_LITHUANIAN}
Push Lithuanian
Push ${LANG_MACEDONIAN}
Push Macedonian
Push ${LANG_MONGOLIAN}
Push Mongolian
Push ${LANG_NORWEGIAN}
Push Norwegian
Push ${LANG_DUTCH}
Push Dutch
Push ${LANG_NORWEGIANNYNORSK}
Push NorwegianNynorsk
Push ${LANG_POLISH}
Push Polish
Push ${LANG_PORTUGUESEBR}
Push PortugueseBR
Push ${LANG_PORTUGUESE}
Push Portuguese
Push ${LANG_ROMANIAN}
Push Romanian
Push ${LANG_RUSSIAN}
Push Russian
Push ${LANG_SLOVAK}
Push Slovak
Push ${LANG_SLOVENIAN}
Push Slovenian
Push ${LANG_SWEDISH}
Push Swedish
Push ${LANG_TURKISH}
Push Turkish
Push ${LANG_UKRAINIAN}
Push Ukrainian
Push ${LANG_SIMPCHINESE}
Push SimpChinese
Push ${LANG_TRADCHINESE}
Push TradChinese
Push A
LangDLL::LangDialog "${APPNAME} Portable Language" "Please select application language."
Pop $LANGUAGE
StrCmp $LANGUAGE "cancel" 0 +2
Abort
FunctionEnd

Function Init
SectionSetSize ${x64} 52500 # kB
${If} ${RunningX64}
SectionSetFlags ${x64} 1
${Else}
${EndIf}
FunctionEnd
