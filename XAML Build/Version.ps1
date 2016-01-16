Param(

    [String]$BuildNumber = $env:TF_BUILD_BUILDNUMBER
)

[String]$String = [String]::Format("#define BINVERSION {0} `r`n#define STRVERSION ""{1}"" `r`n#define YEAR ""{2}""", $BuildNumber.Replace('.', ','), $BuildNumber, (Get-Date -Format yyyy))

[String]$Path = $PSScriptRoot + "\" + "Version.txt"

Out-File -FilePath $Path -InputObject $String