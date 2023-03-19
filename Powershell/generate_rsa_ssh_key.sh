# Install OpenSSH client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Check if ssh-keygen is installed
if (-not (Test-Path "$(Get-Command ssh-keygen).Source")) {
  Write-Error 'Error: ssh-keygen is not installed. Please install OpenSSH before running this script.'
  exit 1
}

# Prompt for key file name
$keyfile = Read-Host -Prompt 'Enter file name for RSA key (default: id_rsa)'
if ([string]::IsNullOrWhiteSpace($keyfile)) {
    $keyfile = 'id_rsa'
}

# Generate RSA key pair
ssh-keygen -t rsa -b 4096 -C "$env:USERNAME@$env:COMPUTERNAME-$((Get-Date).ToString('yyyy-MM-dd'))" -f "$env:USERPROFILE\.ssh\$keyfile"

# Display public key
Write-Host "Here's your public key:"
Get-Content "$env:USERPROFILE\.ssh\$keyfile.pub"

# Set appropriate permissions for private key
icacls "$env:USERPROFILE\.ssh\$keyfile" /reset
icacls "$env:USERPROFILE\.ssh\$keyfile" /inheritance:r
icacls "$env:USERPROFILE\.ssh\$keyfile" /grant:r "$env:USERNAME`:f"
icacls "$env:USERPROFILE\.ssh\$keyfile" /deny SYSTEM:r
