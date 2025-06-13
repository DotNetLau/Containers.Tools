param(
    [Parameter(Mandatory = $false)]
    [string]$instanceName = 'seq-dev',
    [Parameter(Mandatory = $false)]
    [bool]$usePodman = $false
)

if ($usePodman) {
    podman run -d --name $instanceName -p 5341:80 -e ACCEPT_EULA=Y datalust/seq:latest
} else {
    docker run -d --name $instanceName -p 5341:80 -e ACCEPT_EULA=Y datalust/seq:latest
}