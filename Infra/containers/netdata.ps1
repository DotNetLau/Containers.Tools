param(
    [Parameter(Mandatory = $false)]
    [string]$instanceName = 'netdata-dev',
    [Parameter(Mandatory = $false)]
    [bool]$usePodman = $false
)

if ($usePodman) {
    podman run -d --name $instanceName -p 19999:19999 netdata/netdata:stable
} else {
    docker run -d --name $instanceName -p 19999:19999 netdata/netdata:stable
}
