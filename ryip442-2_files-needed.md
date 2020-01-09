# Files Needed:



| File (in order)         | line in ryip44v2_2.bin |
| ----------------------- | ---------------------- |
| errors.hlp              | 3083                   |
| ryip44.bas              | 3145                   |
| ryip44.bcl              | 4660                   |
| ryip44.js               | 6173***                |
| ryip44.tok              | 6376**                 |
| ryip44_dest.js          | 6868***                |
| ryip44_mask.js          | 7040***                |
| ryip44_uiappsetup.html  | 7114***                |
| ryip44_uidest.html      | 7201***                |
| ryip44_uihappsetup.html | 7234***                |
| ryip44_uimask.html      | 7349***                |




# Info about token file ripped from ryip44v2-2.bin

1. Section has a header as follows:
``` 
RST1 Seg:C400 Off:0000 Len:00025DB4 CoB1
```
This seems to indicate this cob file starts at location `C400h` and
has a length of 25DB4h. Which matches up with the file starting at `COB1`
and ending at the estimated loacation in `ryip44v2-2.bin` 



## Comparing with example bcl

compare to example `barionetbcl.cob` from update-recovery to ` barionet.bas `--> tok
then whole directory to .cob

| File (in order)   | Line Number in cob file |
| ----------------- | ----------------------- |
| barionet.tok      | 4***                    |
| VERSION           | 145**                   |
| errors.hlp        | 155                     |
| README.txt        | 221***                  |
| uiappsetup1.html  | 281***                  |
| barionet.bas      | 567**                   |
| uihappsetup1.html | 896***                  |
| README            | 953                     |

** The first lines content of the file starts on the line number documented. Often it is at the end of the previous files last line.

 *** There is `web2cob` generated content in between previous files last line and files first line.