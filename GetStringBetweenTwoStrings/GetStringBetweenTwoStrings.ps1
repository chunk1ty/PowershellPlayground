# calling .\GetStringBetweenTwoStrings.ps1 -FilePath C:\andriyan\personal\repositories\PowershellPlayground\GetStringBetweenTwoStrings\input.txt -FirstString 'account_id":' -SecondString ',"type"'
param (
    [Parameter(Mandatory=$True)][string] $FilePath, 
    [Parameter(Mandatory=$True)][string] $FirstString, 
    [Parameter(Mandatory=$True)][string] $SecondString
)

$file = Get-Content -Path $FilePath

$result
foreach ($line in $file)
{
    $startIndex = $line.IndexOf($FirstString) + $FirstString.Length
    $length = $line.IndexOf($SecondString) - $startIndex
    
    $result += $line.Substring($startIndex, $length)
    $result += [Environment]::NewLine
}

$result | Out-File .\output.txt

Write-Output "Extracting complated successfully."