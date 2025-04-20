# Set parameters
$DistroName = "Ubuntu"                        # Replace with your distro name (use `wsl --list` to check)
$NewDistroName = "UbuntuMoved"                # Optional: new name for the moved distro
$BackupPath = "D:\WSLBackup\Ubuntu.tar"       # Location to save exported tar
$InstallPath = "D:\WSL\Ubuntu"                # New install location on another drive

# Create directories if they don’t exist
New-Item -ItemType Directory -Force -Path (Split-Path $BackupPath)
New-Item -ItemType Directory -Force -Path $InstallPath

# Export current distro
Write-Host "Exporting $DistroName to $BackupPath..."
wsl --export $DistroName $BackupPath

# Unregister the old distro (optional, but needed if you're keeping the same name)
Write-Host "Unregistering $DistroName..."
wsl --unregister $DistroName

# Import the distro to new location
Write-Host "Importing to $InstallPath..."
wsl --import $NewDistroName $InstallPath $BackupPath --version 2

# Optionally, set the new distro as default
# wsl --set-default $NewDistroName

Write-Host "Done! $DistroName has been moved to $InstallPath as $NewDistroName"
