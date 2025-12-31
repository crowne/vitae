#!/usr/bin/env pwsh

# accept an optional parameter to enable --watch mode
param (
    [switch ]$new,
    [switch]$watch
)

New-Item -ItemType Directory -Path "dist" -ErrorAction SilentlyContinue | Out-Null

if ($new) {
    Write-Host "Generating new CV template..."
    docker run -v "$(Get-Location)/src:/work" -w /work ghcr.io/rendercv/rendercv new "John Doe"
    exit 0
}

if ($watch) {
    Write-Host "Running in watch mode..."
    docker compose up --watch
} else {
    Write-Host "Rendering CV..."
    docker run -v "$(Get-Location):/work" -w /work ghcr.io/rendercv/rendercv render src/Neil_Crow_CV.yaml
}

Write-Host "`n"

Copy-Item "src/index.html" -Destination "dist/index.html" -Force


