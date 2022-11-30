function Add-Numbers {
    param($NumString)

    if ($NumString -eq "") {
        return 0
    }

    $DELIMITERS = ",", "`n"

    if ($NumString -like "*`n*" -or $NumString -like "*,*") {
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
