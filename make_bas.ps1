[CmdletBinding()]
param(
	[string]
	#Name of The Patch.
	$PatchName,
	[string][Alias("m","Message")]
	#Description of The Patch.
	$Description,
	[string]
	#Name of the program being compiled (this is also the folder containing all the files).	
	$Name="ryip44",
	[switch][Alias("f")]
	# Force overwrite of existing patch
	$force=$false
)
$CopyParam = @{Recurse = $true}
$self_dir = Get-Location
$outdir = "$self_dir\outputs"

$env:Path += ";$self_dir\dev_kits\barionet50_kit_vb202_20150521\tools"

if ($PatchName) { $outdir = "$self_dir\patches\$PatchName" }
if (! (Test-Path -Path $outdir)) { New-Item $OutDir -ItemType Directory > $null }
elseif ($force) { Write-Host Overwriting Patch. -ForegroundColor Blue ; $CopyParam += @{Force = $true} }
#     = @("Force",$true)}
Else { Write-Error "Patch exists, use -force to overwrite."; exit }

Write-Host " "
Write-Verbose "Running Tokenizer."
Set-Location $Name
tokenizer barionet50 "$Name.bas"
Set-Location $self_dir

Write-Host " "
Write-Verbose "Running web2cob"
web2cob  /o $outdir\$Name.cob /d $Name

$CopyParam.Keys.ForEach({"$_ $($CopyParam.$_)"}) -join ' | '


if ($PatchName) { 
	Write-Verbose "Copping to PatchDirectory." 
	Copy-Item @CopyParam $Name $outdir
	If ($Description) { 
        Write-Output "# Patch Description`n$Description" > $outdir\README.md
	}
} 



