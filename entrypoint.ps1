# Prints the message with the passed arguments
Write-Host "Execution has been started with the following arguments: $args"

# Constructs the command and execute it
$command = -join(".\DevWeb.exe ","$args")
Invoke-Expression $command

# Prints the execution completed message
Write-Host "Execution has been completed. Please check your host machine for the results."