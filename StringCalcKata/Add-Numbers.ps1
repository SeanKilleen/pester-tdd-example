function Add-Numbers {
    param($NumString)

    if ($NumString -eq "") {
        return 0
    }

    [array]$DELIMITERS = ",", "`n"

    if ($NumString -match "(//(.*)\`n)") {
        $FullStartingStringMatch = $Matches[1]
        $Match = $Matches[2]

        $DELIMITERS += $Match

        $NumString = $NumString -replace $FullStartingStringMatch, ""
    }

    $containsDelimeters = $false

    foreach ($searchTerm in $DELIMITERS) {
        if ($NumString -like "*$($searchTerm)*") {
            $containsDelimeters = $true
        }
    }

    [array]$numberArray = @()
    if ($containsDelimeters) {
        $array = $NumString -split { $DELIMITERS -contains $_ }
        $numberArray = foreach ($number in $array) {
            [int]$number
        }
    }
    else {
        $result = [int]$NumString
        $numberArray = @($result)
    }

    foreach ($possibleNegativeNumber in $numberArray) {
        if ($possibleNegativeNumber -lt 0) {
            throw "negatives not allowed; you attempted $possibleNegativeNumber"
        }
    }

    return ($numberArray | Measure-Object -sum).Sum
}
