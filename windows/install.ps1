# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install tools
choco install cppcheck
choco install exiftool
choco install ffmpeg
choco install jq
choco install make
choco install maven
choco install miktex
choco install openjdk
choco install strawberryperl
choco install androidstudio
choco install vscode

# Setup python
choco install visualstudio2019buildtools
choco install python --version=3.10.11
pip install pipx

# Install python app
pipx ensurepath
pipx install poetry
pipx install cookiecutter
pipx install pipenv
pipx install virtualenv
pipx install art
pipx install mypy
pipx install ruff
pipx install pre-commit
pipx install commitizen

# Install Rust and cargo
choco install rust
cargo install pwninit

# Login to github
choco install gh
gh auth login
