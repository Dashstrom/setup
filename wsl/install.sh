if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


user() {
    su "${SUDO_USER}" -c "$1"
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
    pipx


## Install .bashrc
user 'curl -o ~/.bashrc https://raw.githubusercontent.com/Dashstrom/setup/HEAD/wsl/.bashrc'

# Install basic setup for python
sudo apt install pipx

# Install python app
user 'pipx ensurepath'
user 'pipx install poetry'
user 'pipx install pipenv'
user 'pipx install virtualenv'

## Install BFG Repo Cleaner
user 'mkdir -p ~/.local/bin/bfg'
user 'wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar ~/.local/bin/bfg/bfg.jar'

## Install GDB peda
user 'mkdir -p ~/.local/bin/peda'
user 'git clone https://github.com/longld/peda.git ~/.local/bin/peda'
user 'echo "source ~/bin/peda/peda.py" >> ~/.gdbinit'

## Install Ghidra
user 'mkdir -p ~/.local/bin/ghidra'
user 'wget https://codeload.github.com/NationalSecurityAgency/ghidra/tar.gz/refs/tags/Ghidra_10.1.5_build ~/.local/bin/ghidra/ghidra.tar.gz'
user 'tar xvf ~/.local/bin/ghidra/ghidra.tar.gz'
user 'rm ~/.local/bin/ghidra/ghidra.tar.gz'

## Complete your installation
apt autoremove
