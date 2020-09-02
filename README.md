# B-50hack
Reverse Engineering Documentation of Aiphones RY-IP44 BCL Application. See [RY-IP44_ReverseEngineering.md](https://github.com/rbaas293/B-50hack/blob/master/RY-IP44_ReverseEngineering.md).

This Repository Duels as a Development Skeleton for Application Development on a **Barix** [Barionet 50](https://www.barix.com/devices/barionet/barionet-50).

## Compile/tokenize Script
### Name
`make_bas.ps1`

### Usage
`.\make_bas.ps1 [-Name <application-name>] [-PatchName <PatchName>] [-m <patch-description] [-f | -Force]`

#### Parameters

* `Name <application-name>`
  * Name of application directory. Defaults to `ryip44`.
* `PatchName <PatchName>` 
  * Name of patch you are creating, will output to directory `patches/<PatchName>`
* `m <patch-description>` | `Description <patch-description>`
  * Description of patch you are creating, outputs a markdown file to `patches/<PatchName>/README.md`
* `Force`
  * Switch to force overwrite of an existing patch. Defaults to `false`.

#### Example
```PowerShell
.\make_bas.ps1 -Name ryip44 -PatchName test123 -m "Patch to test if the make_bas.ps1 is working properly." -Force`
```
## Compiling/Tokenizing Guide

All of the files of the application must be contained in a directory with the exact name as your `application.bas`. For example if your application is `application.bas`, your directory must be named `application`.

Ours is `ryip44`, within this directory we have our source files.

In order to run on the `Barionet 50` we have to tokenize the program:

```cmd
cd ryip44
..\dev_kits\barionet50_kit_vb202_20150521\tools\tokenizer barionet50 ryip44.bas 
```

This output's the file `ryip44.tok`

#### Convert/consolidate our application into a single COB file:

To be recognized and upload to the barionet50, all application files must be combined into one single COB file. The `web2cob` tool is used to accomplish this:

```cmd
cd ..
dev_kits\barionet50_kit_vb202_20150521\tools\web2cob /o ryip44.cob /d ryip44 # where ryip44 is our application directory.
```

Also, it is required that `mimetype.ini` be in the directory `web2cob` is called from. 