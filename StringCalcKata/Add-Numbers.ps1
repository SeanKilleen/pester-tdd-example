function Add-Numbers {
    param($NumString)

    if ($NumString -eq "") {
        return 0
    }

    if ($NumString -notmatch ",") {
        $result = [int]$NumString
        return $result
    }
    else {
        $array = $NumString -split ","
        $numberArray = foreach ($number in $array) {
            [int]$number
        }

        return ($numberArray | Measure-Object -sum).Sum
    }
}
