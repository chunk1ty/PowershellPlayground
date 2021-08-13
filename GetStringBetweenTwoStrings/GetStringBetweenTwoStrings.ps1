# calling .\GetStringBetweenTwoStrings.ps1 -FilePath C:\andriyan\personal\repositories\PowershellPlayground\GetStringBetweenTwoStrings\input.txt -FirstString 'account_id":' -SecondString ',"type"'
param (
    [Parameter(Mandatory=$True)][string] $FirstString, 
    [Parameter(Mandatory=$True)][string] $SecondString
)

$file = Get-Content -Path C:\andriyan\personal\repositories\PowershellPlayground\GetStringBetweenTwoStrings\input.txt

$result
foreach ($line in $file){
    $firstStringIndex = $line.IndexOf($FirstString)
    if ($firstStringIndex -eq -1) {
        continue
    }
    $startIndex = $firstStringIndex + $FirstString.Length
    $length = $line.IndexOf($SecondString) - $startIndex
    
    $result += $line.Substring($startIndex, $length).Trim()
    $result += [Environment]::NewLine
}

$result | Out-File .\output.txt

Write-Output "Extracting complated successfully."