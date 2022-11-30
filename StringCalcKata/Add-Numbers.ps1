function Add-Numbers {
    param($NumString)

    if ($NumString -eq "") {
        return 0
    }

    [array]$DELIMITERS = ",", "`n"

    if ($NumString -match "(//(.*)\`n)") {
        $FullStartingStringMatch = $Matches[1]
        $Match = $Matches[2]
        Write-Host "Match: $Match"
        $DELIMITERS += $Match

        $NumString = $NumString -replace $FullStartingStringMatch, ""
    }

    $containsDelimeters = $false

    foreach ($searchTerm in $DELIMITERS) {
        if ($NumString -like "*$($searchTerm)*") {
            $containsDelimeters = $true
        }
    }

    if ($containsDelimeters) {
        $array = $NumString -split { $DELIMITERS -contains $_ }
        $numberArray = foreach ($number in $array) {
            [int]$number
        }

        return ($numberArray | Measure-Object -sum).Sum
    }
    else {
        $result = [int]$NumString
        return $result
    }
}
