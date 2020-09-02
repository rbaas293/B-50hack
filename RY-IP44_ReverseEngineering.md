# RY-IP44 BAS Application Files Needed:

`ryip44v2-2.bin` is Located in `resources` subdirectory.


When `ryip44v2-2.bin` is open in `010 Editor` (while viewing in Text/Code view), the following line numbers state the start of the file:

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

Line 1901 has info about imx login stuff. This is where the `Aiphone` tab comes from

# Info about token file ripped from `ryip44v2-2.bin`

One section has a header as follows:
``` 
RST1 Seg:C400 Off:0000 Len:00025DB4 CoB1
```
This seems to indicate this cob file starts at location `C400h` and
has a length of 25DB4h. Which matches up with the file starting at `COB1`
and ending at the estimated loacation in `ryip44v2-2.bin` 


## Comparing With Barix Provided Example `barionet.bas`

comparing to `barionet50_kit_vb202_20150521\update-rescue\barionetbcl.cob` 

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

##### Notes:

```
262FAh



size (old): 25DB4h

start: 3076 or 2DC62h

end (orig): 7374 or 53A15h

end: 

size: 25f49



end (patch_comments): 53D0Dh

size (new_comments) =260ACh
```
