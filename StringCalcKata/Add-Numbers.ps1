function Add-Numbers {
    param($NumString)

    if ($NumString -eq "") {
        return 0
    }

    $result = [int]$NumString
    return $result
}
