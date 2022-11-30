BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Add-Numbers" {
    It "Returns expected output" {
        Add-Numbers | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
