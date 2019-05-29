rem Erases the BCL program in a Barionet 50. Keeps everything else.

set EMPTY=..\update_rescue\empty.cob

@echo off
echo # Erasing BCL in WEB4...
tftp -i %1 put %EMPTY% WEB4
echo # BCL erased...
