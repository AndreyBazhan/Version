Param(

    [Parameter(Mandatory = $True)] [String] $BuildNumber
)

[String] $String = [String]::Format("#define BINVERSION {0} `r`n#define STRVERSION ""{1}"" `r`n#define YEAR ""{2}""", $BuildNumber.Replace('.', ','), $BuildNumber, (Get-Date -Format yyyy))

[String] $CurrentDirectory = Get-Location

[String] $Path = $CurrentDirectory + "\" + "Version.txt"

Out-File -FilePath $Path -InputObject $String
