del bario50web\*.bak
..\tools\web2cob /o bario50web.cob /d bario50web
if !%1==! goto endit
tftp -i %1 put bario50web.cob WEB1
:endit
