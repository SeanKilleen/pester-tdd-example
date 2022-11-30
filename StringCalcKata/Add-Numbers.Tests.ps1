BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Add-Numbers" {
    It "Returns zero when string is empty" {
        Add-Numbers -NumString "" | Should -Be 0
    }

    It "Returns a single value when passed in (<TheInput>: <Expected>)" -Foreach @(
        @{TheInput = "0"; Expected = 0 }
        @{TheInput = "1"; Expected = 1 }
        @{TheInput = "123"; Expected = 123 }
    ) {
        Add-Numbers -NumString $TheInput | Should -Be $Expected
    }

    It "Returns a sum of <Expected> when receiving two-number inputs of <TheInput>" -Foreach @(
        @{TheInput = "0,1"; Expected = 1 }
        @{TheInput = "1,2"; Expected = 3 }
        @{TheInput = "4,6"; Expected = 10 }
        @{TheInput = "1,2,3,4"; Expected = 10 }
    ) {
        Add-Numbers -NumString $TheInput | Should -Be $Expected
    }
}

