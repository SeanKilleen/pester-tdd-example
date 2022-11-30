BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Add-Numbers" {
    It "Returns zero when string is empty" {
        Add-Numbers "" | Should -Be 0
    }

    It "Returns a single value when passed in (<input>: <expected>)" -Foreach @(
        @{Input = "0"; Expected = 0 }
        @{Input = "1"; Expected = 1 }
        @{Input = "123"; Expected = 123 }
    ) {
        Add-Numbers $input | Should -Be $expected
    }
}

