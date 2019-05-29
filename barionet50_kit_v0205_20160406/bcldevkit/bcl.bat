set TARGET=barionet.bas
set FOLDER=serial_io_tunnel

cd %FOLDER%
del *.bak

..\..\tools\tokenizer.exe barionet50 %TARGET%
if errorlevel 1 goto quit
cd ..
..\tools\web2cob /o barionetbcl.cob /d %FOLDER%
if !%1==! goto endit
tftp -i %1 put barionetbcl.cob WEB4
goto endit
:quit
echo "ERROR - TOKENIZER REPORTS FAILURE"
cd ..
:endit
