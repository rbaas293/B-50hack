# B-50hack
if you know you know

and so you can know even more...

## Compiling/Tokenizing Guide

All of the files of the application must be contained in a directory with the exact name as your `application.bas`. For example if your application is `application.bas`, your directory must be named `application`.

Ours is `ryip44`, within this directory we have our source files.

In order to run on the barionet50 we have to tokenize the program:

`cd ryip44`

`..\barionet50_kit_vb202_20150521\tools\tokenizer barionet50 ryip44.bas `

This output's the file `ryip44.tok`

#### Convert/consolidate our application into a single COB file:

To be recognized and upload to the barionet50, all application files must be combined into one single COB file. The `web2cob` tool is used to accomplish this:

`cd ..`

`barionet50_kit_vb202_20150521\tools\web2cob /o ryip44.cob /d ryip44` where ryip44 is our application directory.

Also, it is required that `mimetype.ini` be in the directory `web2cob` is called from. 

262FAh



size (old): 25DB4h

start: 3076 or 2DC62h

end (orig): 7374 or 53A15h

end: 

size: 25f49



end (patch_comments): 53D0Dh

size (new_comments) =260ACh