# Setup

⚠️ All scripts are untested for now.

## Install WSL

Run [install.sh](https://raw.githubusercontent.com/Dashstrom/setup/HEAD/wsl/install.sh)

```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dashstrom/setup/HEAD/wsl/install.sh)" && source ./.bashrc
```

## Install Windows

Run [install.ps1](https://raw.githubusercontent.com/Dashstrom/setup/HEAD/windows/install.sh)

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Dashstrom/setup/HEAD/windows/install.sh'))
```
