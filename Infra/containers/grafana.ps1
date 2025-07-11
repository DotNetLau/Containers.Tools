param(
    [Parameter(Mandatory = $false)]
    [string]$instanceName = 'grafana-dev',
    [Parameter(Mandatory = $false)]
    [bool]$usePodman = $false
)

if ($usePodman) {
    podman run -d --name $instanceName -p 3000:3000 grafana/grafana
} else {
    docker run -d --name $instanceName -p 3000:3000 grafana/grafana
}