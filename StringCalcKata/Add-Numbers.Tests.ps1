BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Add-Numbers" {
    It "Returns zero when string is empty" {
        Add-Numbers "" | Should -Be 0
    }
}
