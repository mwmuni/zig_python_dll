# If uv is not installed, install it
if (-not (Test-Path -Path $(Get-Command uv).Source)) {
    # Ask the user if they want to install uv
    $answer = Read-Host -Prompt "uv is not installed. Do you want to install it? (y/n)"
    if ($answer -eq "y") {
        Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
    } else {
        Write-Host "uv is not installed. Exiting..."
        exit 1
    }
}

# If Zig is not installed, install it
if (-not (Test-Path -Path $(Get-Command zig).Source)) {
    # Ask the user if they want to install Zig
    $answer = Read-Host -Prompt "Zig is not installed. Do you want to install it? (y/n)"
    if ($answer -eq "y") {
        winget install -e --id Zig.Zig
    } else {
        Write-Host "Zig is not installed. Exiting..."
        exit 1
    }
}

zig build --release=fast
Remove-Item .\compute.dll -Force
Move-Item .\zig-out\bin\compute.dll .
uv run main.py