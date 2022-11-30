# pester-tdd-example

A quick example of TDD using pester. The commits to the main branch are done as small commits where we write a failing test and then the code to pass it.

For this exercise, implemented some of the [String Calculator Kata](https://osherove.com/tdd-kata-1)

## Installing The Latest Pester

* `Install-Module Pester -Force -SkipPublisherCheck`

## Running pester tests

* Go to the directory you care about
* In your prompt, run `Import-Module Pester`
* In your prompt, run `Invoke-Pester`.

## Other Tips

* To create the new fixture, we used `New-Fixture -Name Add-Numbers -Path .\StringCalcKata -Verbose`
