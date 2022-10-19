# How to setup your beautiful and functional Ubuntu

⚠️ We suppose your working directory is the repository

```sh
git clone https://github.com/Dashstrom/dashup.git
cd dashup
```

## Basic setup

```sh
sudo apt -y update && sudo apt -y upgrade
sudo apt -y install --reinstall git build-essential manpages-dev gdb gcc tree bat unzip p7zip-full p7zip-rar
```

## Update Ubuntu version

```sh
do-release-update
```

## Change desktop

```sh
sudo apt install kubuntu-desktop
```

## Install python 3.10

⚠️ Install required for ubuntu version below 22

```sh
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt -y install --reinstall python3.10 python3.10-dev python3.10-distutils python3.10-venv python3-cffi libcairo2-dev libgirepository1.0-dev python3-testresources
python3.10 -V
```

## Install pip, pipenv and default package

⚠️ Don't use sudo if it's not indicated, it will break your installation (please trust me)

```sh
sudo apt -y install mypy pipenv python3-pip
python3.10 -m pip install wheel
python3.10 -m pip install --user -r requirements.txt
python3.10 -V && pip -V && mypy -V && isort --version && flake8 --version && pylint --version 
```

## Install Java

```sh
sudo apt install openjdk-17-jdk
java --version
```

## Install BFG Repo Cleaner

```sh
mkdir -p ~/bin/bfg
wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar ~/bin/bfg/bfg.jar
```

## Install GDB peda

```sh
mkdir -p ~/bin/peda
git clone https://github.com/longld/peda.git ~/bin/peda
echo "source ~/bin/peda/peda.py" >> ~/.gdbinit
```

## Install Ghidra

```sh
mkdir -p ~/bin/ghidra
wget https://codeload.github.com/NationalSecurityAgency/ghidra/tar.gz/refs/tags/Ghidra_10.1.5_build ~/bin/ghidra/a.tar.gz
tar xvf ~/bin/ghidra/a.gz
rm ~/bin/ghidra/a.gz
```

## Install .bashrc

```sh
mv .bashrc ~/.bashrc
source ~/.bashrc
```

## Complete your installation

```sh
sudo apt autoremove
reboot
```
