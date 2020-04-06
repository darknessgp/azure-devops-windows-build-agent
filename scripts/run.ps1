$url = $env:AZP_URL
$token = $env:AZP_TOKEN
$pool = $env:AZP_POOL
$agentName = $env:AZP_AGENT_NAME

Remove-Item $env:AZDO_PAT -ErrorAction SilentlyContinue

Write-Verbose -Verbose "Configuring agent $agentName for pool $pool"
Write-Verbose -Verbose "Azure URL: $($url)"
Write-Verbose -Verbose "Azure Pool: $($pool)"
Write-Verbose -Verbose "Azure Agent: $($agentName)"

Set-Location c:\agent
Write-Verbose -Verbose "Configuring Agent"
.\config.cmd --unattended --url $url --auth pat --token $token --pool $pool --agent $agentName --acceptTeeEula --replace 

Write-Verbose -Verbose "Running Agent"
.\run.cmd

pause