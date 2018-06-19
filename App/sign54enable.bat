@echo off
copy /y "%~d0%~p0DefaultFirefox\config.js" "%~d0%~p0Firefox\config.js"
copy /y  "%~d0%~p0DefaultFirefox\defaults\pref\config-prefs.js" "%~d0%~p0Firefox\defaults\pref\config-prefs.js"