param(
    [Parameter(Mandatory = $true)]
    [string]$userName,
    [Parameter(Mandatory = $true)]
    [ValidateLength(10,30)]
    [ValidateScript({
        $password = $_
        $hasUpper = $password -cmatch '[A-Z]' # Uppercase letter
        $hasLower = $password -cmatch '[a-z]' # Lowercase letter
        $hasDigit = $password -cmatch '\d' # Digit
        $hasSymbol = $password -cmatch '[!@#$%^&*()_+\-=\[\]{};:'',.<>?]' # Symbol
        ($hasUpper + $hasLower + $hasDigit + $hasSymbol) -ge 3 # At least 3 of the above
    })]
    [string]$pass,
    [Parameter(Mandatory = $false)]
    [string]$hostName = 'rabbitmq-main',
    [Parameter(Mandatory = $false)]
    [string]$instanceName = 'rabbitmq-dev',
    [Parameter(Mandatory = $false)]
    [bool]$usePodman = $false
)

if ($usePodman) {
    podman run -d --hostname $hostName --name $instanceName -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=$userName -e RABBITMQ_DEFAULT_PASS=$pass rabbitmq:3-management
} else {
    docker run -d --hostname $hostName --name $instanceName -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=$userName -e RABBITMQ_DEFAULT_PASS=$pass rabbitmq:3-management
}
