#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

user() {
    su - "${SUDO_USER}" -c "$1"
}

# Update
apt -y update

# Upgrade
apt -y upgrade

# Install app
apt -y install \
    git \
    libssl-dev \
    build-essential \
    manpages-dev \
    gdb \
    gcc \
    gcc-multilib \
    libc6-dbg \
    tree \
    bat \
    unzip \
    p7zip-full \
    p7zip-rar \
    jq \
    patchelf \
    libimage-exiftool-perl \
    python3-dbg \
    python3-dev \
    python3-venv \
    python3-cffi \
    python3-testresources \
    libcairo2-dev \
    libgirepository1.0-dev \
    pipenv \
    python3-pip \
    openjdk-17-jdk \
    cmake \
    liblzma-dev \
    pipx \
    apktool \
    gh

# Add autoamtic resolution of JAVA_HOME
echo -e '\nexport JAVA_HOME="$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")"\n' >> /etc/profile

# Install .bashrc
user 'curl -o ~/.bashrc https://raw.githubusercontent.com/Dashstrom/setup/HEAD/wsl/.bashrc'

# Install pipx for isolated install in python
sudo apt install pipx

# Fix missing package disutils (removed in 3.12)
user 'python3 -m pip install --upgrade setuptools'

# Install python app
user 'pipx ensurepath'
user 'pipx install poetry'
user 'pipx install cookiecutter'
user 'pipx install pipenv'
user 'pipx install virtualenv'
user 'pipx install art'
user 'pipx install mypy'
user 'pipx install ruff'
user 'pipx install pre-commit'
user 'pipx install commitizen'

# Install Rust and cargo
curl https://sh.rustup.rs -sSf | sh

# Install pwninit
cargo install pwninit

# Create ascii art
user 'mkdir -p ~/.local/etc/art'
user 'cd ~/.local/etc/art; art save "$USER" small'

# Install BFG Repo Cleaner
user 'mkdir -p ~/.local/bin/bfg'
user 'curl -o ~/.local/bin/bfg/bfg.jar https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar'

# Install GDB peda
user 'mkdir -p ~/.local/bin/peda'
user 'git clone https://github.com/longld/peda.git ~/.local/bin/peda'
user 'echo "source ~/.local/bin/peda/peda.py" >> ~/.gdbinit'

# Install Ghidra
user 'mkdir -p ~/.local/bin/ghidra'
user 'curl -o ~/.local/bin/ghidra/ghidra.tar.gz https://codeload.github.com/NationalSecurityAgency/ghidra/tar.gz/refs/tags/Ghidra_11.1.2_build'
user 'tar xvf ~/.local/bin/ghidra/ghidra.tar.gz -C ~/.local/bin/ghidra'
user 'rm ~/.local/bin/ghidra/ghidra.tar.gz'

# Install Ghidra
user 'mkdir -p ~/.local/bin/ghidra'
user 'curl -o ~/.local/bin/ghidra/ghidra.tar.gz https://codeload.github.com/NationalSecurityAgency/ghidra/tar.gz/refs/tags/Ghidra_11.1.2_build'
user 'tar xvf ~/.local/bin/ghidra/ghidra.tar.gz -C ~/.local/bin/ghidra'
user 'rm ~/.local/bin/ghidra/ghidra.tar.gz'

# Install gdre
user 'mkdir -p ~/.local/etc/gdre'
user 'wget -O ~/.local/etc/gdre/gdre.zip https://github.com/bruvzg/gdsdecomp/releases/download/v0.6.2/GDRE_tools-v0.6.2-linux.zip'
user 'unzip ~/.local/etc/gdre/gdre.zip -d ~/.local/etc/gdre'
user 'rm ~/.local/etc/gdre/gdre.zip'
user 'chmod +x ~/.local/etc/gdre/gdre_tools.x86_64'
user 'ln -s ~/.local/etc/gdre/gdre_tools.x86_64 ~/.local/bin/gdre'

# Complete your installation
apt autoremove

# Login to github
gh auth login
