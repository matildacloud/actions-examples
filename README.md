# GitHub Actions - Install Telnet

A simple GitHub Action that installs the telnet package on a remote server using password authentication.

## Features

- **Password Authentication**: Uses SSH password instead of SSH keys
- **Multi-OS Support**: Supports apt, yum, dnf, and zypper package managers
- **Automatic Detection**: Automatically detects and uses the appropriate package manager
- **Installation Verification**: Verifies that telnet was installed successfully
- **Secure**: Uses GitHub secrets to store sensitive information

## Quick Start

### 1. Set up GitHub Secrets

Add these secrets to your repository:

- `SERVER_HOST` - Your server's IP address or hostname
- `SERVER_USERNAME` - SSH username
- `SERVER_PASSWORD` - SSH password
- `SSH_PORT` (optional) - SSH port (defaults to 22)
- `PACKAGE_MANAGER` (optional) - Package manager type (defaults to 'apt')

### 2. Run the Workflow

1. Go to your repository on GitHub
2. Click on "Actions" tab
3. Select "Install Telnet" workflow
4. Click "Run workflow"
5. The workflow will install telnet on your server

## Supported Operating Systems

- **Ubuntu/Debian**: Uses `apt` package manager
- **CentOS 7/RHEL 7**: Uses `yum` package manager  
- **CentOS 8+/RHEL 8+/Fedora**: Uses `dnf` package manager
- **openSUSE/SUSE**: Uses `zypper` package manager

## How It Works

The workflow:

1. **Installs sshpass**: A tool that allows SSH password authentication
2. **Connects to server**: Uses your provided credentials
3. **Updates package list**: Runs the appropriate update command for your OS
4. **Installs telnet**: Installs the telnet package
5. **Verifies installation**: Checks that telnet was installed correctly

## Example Commands

The workflow will run these commands on your server:

**For Ubuntu/Debian:**
```bash
sudo apt-get update && sudo apt-get install -y telnet
```

**For CentOS/RHEL:**
```bash
sudo yum install -y telnet
```

**For CentOS 8+/RHEL 8+:**
```bash
sudo dnf install -y telnet
```

**For openSUSE:**
```bash
sudo zypper install -y telnet
```

## Security Considerations

⚠️ **Important Security Notes:**

- **Password Storage**: Store passwords as GitHub secrets, never in plain text
- **Network Access**: Your server must allow SSH connections from GitHub Actions runners
- **Sudo Access**: The SSH user must have sudo privileges for package installation
- **Firewall**: Ensure port 22 (or your custom SSH port) is accessible

## Troubleshooting

### Common Issues:

1. **Connection Refused**: Check if SSH port is open and accessible
2. **Permission Denied**: Ensure the SSH user has sudo privileges
3. **Package Not Found**: Verify the correct package manager is specified
4. **Authentication Failed**: Double-check username and password in secrets

### Debug Steps:

1. Verify your GitHub secrets are set correctly
2. Test SSH connection manually: `ssh username@your-server`
3. Check if the user has sudo access: `sudo whoami`
4. Verify the package manager is available: `which apt` or `which yum`

## Requirements

- Server with SSH access
- SSH user with sudo privileges
- Network connectivity from GitHub Actions to your server
- Supported Linux distribution (Ubuntu, CentOS, RHEL, openSUSE, etc.)

## License

This project is open source and available under the MIT License.