[CmdletBinding()]
param(
	#Name of the patch
	[string]$PatchName,
	#Name of the program being compiled (this is also the folder containing all the files.
	[string]$Name="ryip44",
	[switch]
	[Alias("f")]
	# Force overwrite of existing patch
	$force
)
$self_dir = pwd
$outdir = "$self_dir\outputs"

$env:Path += ";$self_dir\barionet50_kit_vb202_20150521\tools"

if ($PatchName) { $outdir = "$self_dir\patches\$PatchName" }
if (! (Test-Path -Path $outdir)) { mkdir $OutDir }
elseif ($force = $true) { Write-Host Overwriting Patch. -ForegroundColor Blue }
Else { Write-Error "Patch exists, use -force to overwrite."; exit }

Write-Host " "
Write-Verbose "Running Tokenizer."
cd $Name
tokenizer barionet50 ryip44.bas
cd $self_dir

Write-Host " "
Write-Verbose "Running web2cob"
web2cob  /o $outdir\$name.cob /d $name


if ($PatchName) { Write-Verbose "Copping to PatchDirectory."; cp -r $Name $outdir -force } 



