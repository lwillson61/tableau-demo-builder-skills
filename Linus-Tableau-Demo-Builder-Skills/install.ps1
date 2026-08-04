$ErrorActionPreference = "Stop"

$TargetDir = if ($args.Count -gt 0) { $args[0] } else { (Get-Location).Path }
$PackDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Installing Linus Tableau Demo Builder Skills into: $TargetDir"

New-Item -ItemType Directory -Force -Path (Join-Path $TargetDir "skills") | Out-Null
Copy-Item -Path (Join-Path $PackDir "skills\*") -Destination (Join-Path $TargetDir "skills") -Recurse -Force

New-Item -ItemType Directory -Force -Path (Join-Path $TargetDir "memory") | Out-Null
$MemoryPath = Join-Path $TargetDir "memory\MEMORY.md"
if (-not (Test-Path $MemoryPath)) {
    Copy-Item -Path (Join-Path $PackDir "memory\MEMORY.md") -Destination $MemoryPath -Force
    Write-Host "Created memory/MEMORY.md from template."
} else {
    Write-Host "memory/MEMORY.md already exists; left unchanged."
}

Write-Host "Install complete."
Write-Host "Next step: read skills/end-to-end-demo-builder/SKILL.md"
