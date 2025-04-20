# Set parameters
$DistroName = "Ubuntu"                        # Replace with your distro name (use `wsl --list --verbose` to check)
$NewDistroName = "UbuntuMoved"                # Optional: new name for the moved distro
$BackupPath = "D:\WSLBackup\Ubuntu.tar"       # Location to save exported tar file
$InstallPath = "D:\WSL\Ubuntu"                # New install location on another drive

# Create directories if they don’t exist
New-Item -ItemType Directory -Force -Path (Split-Path $BackupPath)
New-Item -ItemType Directory -Force -Path $InstallPath

# Export current distro
Write-Host "Exporting $DistroName to $BackupPath..."
wsl --export $DistroName $BackupPath

# Unregister the old distro (⚠️ required if you're reusing the same name for import)
# Make sure the distro is not running before this step: use `wsl --terminate <DistroName>` if needed
Write-Host "Unregistering $DistroName..."
wsl --unregister $DistroName

# Import the distro to the new location
Write-Host "Importing to $InstallPath..."
wsl --import $NewDistroName $InstallPath $BackupPath --version 2  # Ensure you use version 2 if required

# Optionally, set the new distro as the default one
# wsl --set-default $NewDistroName

Write-Host "Done! $DistroName has been moved to $InstallPath as $NewDistroName"

# Additional Notes:
# - Use `wsl --list --verbose` to view installed distros and their status
# - You can automate this script for multiple distros by wrapping it in a loop
# - This process keeps all files, settings, and installed packages intact
