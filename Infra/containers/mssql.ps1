param(
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
    [string]$instanceName = 'mssqlserver-2022',
    [Parameter(Mandatory = $false)]
    [bool]$usePodman = $false
)

if ($usePodman) {
    podman run -d --name $instanceName -p 1433:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$pass" mcr.microsoft.com/mssql/server:2022-latest
} else {
    docker run -d --name $instanceName -p 1433:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$pass" mcr.microsoft.com/mssql/server:2022-latest
}
