::********************************************************************
:: Dump Skript zur Erzeugung eines Festplatten Images auf Laufwerk C:
::********************************************************************
@echo off

:: Altes Image löschen
echo.
if exist c:/PVRIMAGE.bin echo Loesche altes Image
if exist c:/PVRIMAGE.bin echo .
if exist c:/PVRIMAGE.bin del C:/PVRIMAGE.bin

:: Neues Image erzeugen
echo Erzeuge Image "C:/PVRIMAGE.bin"
ddd.exe C:/PVRIMAGE.bin

:: Programm Exitcode auswerten
for %%e in (0 1 2 3 4 5 6 7 8 9 10 11) do IF errorlevel %%e set el=%%e
if errorlevel 11 set EL=11
if %el% == 11 goto 0
if %el% == 1 goto 1
if %el% == 2 goto 2
if %el% == 3 goto 3
if %el% == 4 goto 4
if %el% == 5 goto 5
if %el% == 6 goto 6
if %el% == 7 goto 7
if %el% == 8 goto 8
if %el% == 9 goto 9
if %el% == 10 goto 10

:: Programm Exitcode anzeigen
echo.
echo.
:0
echo Keine Fehler!
goto END
:1
echo Fehler 1: nicht unterstütztes Betriebssystem (Windows 9x und NT)!
goto END
:2
echo Fehler 2: keine Kommandozeilenargumente angegeben!
goto END
:3
echo Fehler 3: PVR Festplatte nicht gefunden!
goto END
:4
echo Fehler 4: keine Dump Image Datei angegeben!
goto END
:5
echo Fehler 5: kein Lesezugriff auf physikalisches Laufwerk!
goto END
:6
echo Fehler 6: kein Schreibzugriff auf physikalisches Laufwerk!
goto END
:7
echo Fehler 7: kein Lesezugriff auf Dump Image!
goto END
:8
echo Fehler 8: kein Schreibzugriff auf Dump Image!
goto END
:9
echo Fehler 9: ungültige Kommandozeile!
goto END
:10
echo Fehler 10: Programm wurde abgebrochen!
goto END

:: Skript Ende
:END
echo.
pause
echo.
