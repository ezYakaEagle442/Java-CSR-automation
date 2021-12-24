copy DeploymentRuleSet.jar \\mycompany.com\Dfs\OSS\Configuration_Packaging\JRE_RuleSet\UAT
copy ruleset_change_log.txt\\mycompany.com\Dfs\OSS\Configuration_Packaging\JRE_RuleSet\UAT

%windir%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "%~dp0Get-DRS-version.ps1" -get_drs_version
copy JRE_DRS_latest_version.txt \\mycompany.com\Dfs\OSS\Configuration_Packaging\JRE_RuleSet\UAT
