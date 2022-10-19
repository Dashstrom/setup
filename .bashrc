# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# active completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

#-----------------------------------------------------------------------#
#                                                                       #
#                             Setup section                             #
#                                                                       #
#-----------------------------------------------------------------------#

# Config
# you can put an ascii art ~/.asciiart 

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# remove pip warning debug
#export _PIP_LOCATIONS_NO_WARN_ON_MISMATCH=0


#-----------------------------------------------------------------------#
#                                                                       #
#                             Color section                             #
#                                                                       #
#-----------------------------------------------------------------------#

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(Shell=/bin/sh lesspipe)"

# set a fancy Prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) use_color=true;;
    *) use_color=false;;
esac

neon="\[\033[01;96m\]"
red="\[\033[0;31m\]"
lpurple="\[\033[1;35m\]"
reset="\[\033[0m\]"
yellow="\[\033[1;33m\]"
lwhite="\[\033[0;39m\]"
green="\[\033[0;32m\]"

t="\342\224\200"    # ─
trd="\342\224\214"  # ┌
n="\342\224\224"    # └
p="\342\225\274"    # ╼

# art at login
export ART=$(cat <<-END
    ____             __         __                     
   / __ \\____ ______/ /_  _____/ /__________  ____ ___ 
  / / / / __ \`/ ___/ __ \\/ ___/ __/ ___/ __ \\/ __ \`__ \\ 
 / /_/ / /_/ (__  ) / / (__  ) /_/ /  / /_/ / / / / / /
/_____/\\__,_/____/_/ /_/____/\\__/_/   \\____/_/ /_/ /_/ 
 
END
)

# only available for colorful terminal
if [ "$use_color" = true ]; then
    PS1="$red$trd$t[$lpurple\t$red]$t[$yellow\$?$red]$t[$lwhite\u$yellow@$neon\h$red]$t[$green\W$red]\n$red$n$t$t$p $reset$yellow\$$reset "
    ART="\033[1;31m$ART\033[0;0m\n"
    
    # generate from `vivid generate molokai` : https://github.com/sharkdp/vivid 
    export LS_COLORS="pi=0;38;2;0;0;0;48;2;102;217;239:cd=0;38;2;249;38;114;48;2;51;51;51:or=0;38;2;0;0;0;48;2;255;74;68:bd=0;38;2;102;217;239;48;2;51;51;51:di=0;38;2;102;217;239:mi=0;38;2;0;0;0;48;2;255;74;68:*~=0;38;2;122;112;112:ln=0;38;2;249;38;114:so=0;38;2;0;0;0;48;2;249;38;114:ow=0:no=0:ex=1;38;2;249;38;114:fi=0:tw=0:st=0:*.c=0;38;2;0;255;135:*.m=0;38;2;0;255;135:*.o=0;38;2;122;112;112:*.a=1;38;2;249;38;114:*.z=4;38;2;249;38;114:*.h=0;38;2;0;255;135:*.p=0;38;2;0;255;135:*.t=0;38;2;0;255;135:*.r=0;38;2;0;255;135:*.d=0;38;2;0;255;135:*.hh=0;38;2;0;255;135:*css=0;38;2;0;255;135:*.kt=0;38;2;0;255;135:*.la=0;38;2;122;112;112:*.ui=0;38;2;166;226;46:*.jl=0;38;2;0;255;135:*.js=0;38;2;0;255;135:*.cs=0;38;2;0;255;135:*.xz=4;38;2;249;38;114:*.lo=0;38;2;122;112;112:*.rm=0;38;2;253;151;31:*.md=0;38;2;226;209;57:*.di=0;38;2;0;255;135:*.so=1;38;2;249;38;114:*.ts=0;38;2;0;255;135:*.rs=0;38;2;0;255;135:*.pp=0;38;2;0;255;135:*.nb=0;38;2;0;255;135:*.cp=0;38;2;0;255;135:*.bc=0;38;2;122;112;112:*.fs=0;38;2;0;255;135:*.cc=0;38;2;0;255;135:*.pm=0;38;2;0;255;135:*.ex=0;38;2;0;255;135:*.gv=0;38;2;0;255;135:*.ml=0;38;2;0;255;135:*.7z=4;38;2;249;38;114:*.rb=0;38;2;0;255;135:*.gz=4;38;2;249;38;114:*.ps=0;38;2;230;219;116:*.cr=0;38;2;0;255;135:*.hi=0;38;2;122;112;112:*.bz=4;38;2;249;38;114:*.sh=0;38;2;0;255;135:*.vb=0;38;2;0;255;135:*.hs=0;38;2;0;255;135:*.ko=1;38;2;249;38;114:*.td=0;38;2;0;255;135:*.ll=0;38;2;0;255;135:*.py=0;38;2;0;255;135:*.go=0;38;2;0;255;135:*.as=0;38;2;0;255;135:*.pl=0;38;2;0;255;135:*.el=0;38;2;0;255;135:*.mn=0;38;2;0;255;135:*.vim=0;38;2;0;255;135:*.ltx=0;38;2;0;255;135:*.bib=0;38;2;166;226;46:*.bin=4;38;2;249;38;114:*.m4a=0;38;2;253;151;31:*.aux=0;38;2;122;112;112:*.com=1;38;2;249;38;114:*TODO=1:*.zst=4;38;2;249;38;114:*.gvy=0;38;2;0;255;135:*.tmp=0;38;2;122;112;112:*.wmv=0;38;2;253;151;31:*.aif=0;38;2;253;151;31:*.mkv=0;38;2;253;151;31:*.eps=0;38;2;253;151;31:*.bz2=4;38;2;249;38;114:*.ps1=0;38;2;0;255;135:*.mpg=0;38;2;253;151;31:*.arj=4;38;2;249;38;114:*.php=0;38;2;0;255;135:*.pro=0;38;2;166;226;46:*.deb=4;38;2;249;38;114:*.c++=0;38;2;0;255;135:*.vcd=4;38;2;249;38;114:*.kex=0;38;2;230;219;116:*.ilg=0;38;2;122;112;112:*.gif=0;38;2;253;151;31:*.hpp=0;38;2;0;255;135:*.fsi=0;38;2;0;255;135:*.txt=0;38;2;226;209;57:*.elm=0;38;2;0;255;135:*.ppt=0;38;2;230;219;116:*.sbt=0;38;2;0;255;135:*.csx=0;38;2;0;255;135:*.svg=0;38;2;253;151;31:*.tif=0;38;2;253;151;31:*.htm=0;38;2;226;209;57:*.bak=0;38;2;122;112;112:*.yml=0;38;2;166;226;46:*.asa=0;38;2;0;255;135:*.git=0;38;2;122;112;112:*.fon=0;38;2;253;151;31:*.blg=0;38;2;122;112;112:*.ods=0;38;2;230;219;116:*.pps=0;38;2;230;219;116:*.inl=0;38;2;0;255;135:*.sxw=0;38;2;230;219;116:*.mir=0;38;2;0;255;135:*.bsh=0;38;2;0;255;135:*.def=0;38;2;0;255;135:*.h++=0;38;2;0;255;135:*.swp=0;38;2;122;112;112:*.nix=0;38;2;166;226;46:*.lua=0;38;2;0;255;135:*.dox=0;38;2;166;226;46:*.fnt=0;38;2;253;151;31:*.dot=0;38;2;0;255;135:*.bst=0;38;2;166;226;46:*.awk=0;38;2;0;255;135:*.swf=0;38;2;253;151;31:*.wma=0;38;2;253;151;31:*.mp3=0;38;2;253;151;31:*hgrc=0;38;2;166;226;46:*.pkg=4;38;2;249;38;114:*.xls=0;38;2;230;219;116:*.tar=4;38;2;249;38;114:*.bbl=0;38;2;122;112;112:*.fls=0;38;2;122;112;112:*.jar=4;38;2;249;38;114:*.htc=0;38;2;0;255;135:*.inc=0;38;2;0;255;135:*.pod=0;38;2;0;255;135:*.clj=0;38;2;0;255;135:*.wav=0;38;2;253;151;31:*.sql=0;38;2;0;255;135:*.log=0;38;2;122;112;112:*.bag=4;38;2;249;38;114:*.tsx=0;38;2;0;255;135:*.xmp=0;38;2;166;226;46:*.doc=0;38;2;230;219;116:*.exe=1;38;2;249;38;114:*.cfg=0;38;2;166;226;46:*.tml=0;38;2;166;226;46:*.kts=0;38;2;0;255;135:*.ind=0;38;2;122;112;112:*.toc=0;38;2;122;112;112:*.psd=0;38;2;253;151;31:*.pgm=0;38;2;253;151;31:*.rtf=0;38;2;230;219;116:*.ipp=0;38;2;0;255;135:*.xml=0;38;2;226;209;57:*.zsh=0;38;2;0;255;135:*.vob=0;38;2;253;151;31:*.ttf=0;38;2;253;151;31:*.rpm=4;38;2;249;38;114:*.mp4=0;38;2;253;151;31:*.iso=4;38;2;249;38;114:*.sxi=0;38;2;230;219;116:*.apk=4;38;2;249;38;114:*.tcl=0;38;2;0;255;135:*.fsx=0;38;2;0;255;135:*.pid=0;38;2;122;112;112:*.tgz=4;38;2;249;38;114:*.epp=0;38;2;0;255;135:*.mli=0;38;2;0;255;135:*.zip=4;38;2;249;38;114:*.ini=0;38;2;166;226;46:*.cpp=0;38;2;0;255;135:*.exs=0;38;2;0;255;135:*.hxx=0;38;2;0;255;135:*.ico=0;38;2;253;151;31:*.bat=1;38;2;249;38;114:*.bcf=0;38;2;122;112;112:*.flv=0;38;2;253;151;31:*.rst=0;38;2;226;209;57:*.otf=0;38;2;253;151;31:*.dmg=4;38;2;249;38;114:*.xcf=0;38;2;253;151;31:*.cxx=0;38;2;0;255;135:*.pyc=0;38;2;122;112;112:*.png=0;38;2;253;151;31:*.ics=0;38;2;230;219;116:*.ogg=0;38;2;253;151;31:*.ppm=0;38;2;253;151;31:*.idx=0;38;2;122;112;112:*.img=4;38;2;249;38;114:*.pbm=0;38;2;253;151;31:*.pas=0;38;2;0;255;135:*.out=0;38;2;122;112;112:*.pdf=0;38;2;230;219;116:*.bmp=0;38;2;253;151;31:*.rar=4;38;2;249;38;114:*.tex=0;38;2;0;255;135:*.m4v=0;38;2;253;151;31:*.csv=0;38;2;226;209;57:*.odp=0;38;2;230;219;116:*.cgi=0;38;2;0;255;135:*.dpr=0;38;2;0;255;135:*.mov=0;38;2;253;151;31:*.xlr=0;38;2;230;219;116:*.jpg=0;38;2;253;151;31:*.odt=0;38;2;230;219;116:*.tbz=4;38;2;249;38;114:*.erl=0;38;2;0;255;135:*.dll=1;38;2;249;38;114:*.sty=0;38;2;122;112;112:*.mid=0;38;2;253;151;31:*.avi=0;38;2;253;151;31:*.mpeg=0;38;2;253;151;31:*.diff=0;38;2;0;255;135:*.conf=0;38;2;166;226;46:*.lock=0;38;2;122;112;112:*.dart=0;38;2;0;255;135:*.tiff=0;38;2;253;151;31:*.lisp=0;38;2;0;255;135:*.psd1=0;38;2;0;255;135:*.xlsx=0;38;2;230;219;116:*.h264=0;38;2;253;151;31:*.fish=0;38;2;0;255;135:*.orig=0;38;2;122;112;112:*.purs=0;38;2;0;255;135:*.yaml=0;38;2;166;226;46:*.html=0;38;2;226;209;57:*.psm1=0;38;2;0;255;135:*.bash=0;38;2;0;255;135:*.less=0;38;2;0;255;135:*.java=0;38;2;0;255;135:*.epub=0;38;2;230;219;116:*.pptx=0;38;2;230;219;116:*.docx=0;38;2;230;219;116:*.json=0;38;2;166;226;46:*.toml=0;38;2;166;226;46:*.hgrc=0;38;2;166;226;46:*.make=0;38;2;166;226;46:*.jpeg=0;38;2;253;151;31:*.tbz2=4;38;2;249;38;114:*.rlib=0;38;2;122;112;112:*.flac=0;38;2;253;151;31:*passwd=0;38;2;166;226;46:*.mdown=0;38;2;226;209;57:*.cmake=0;38;2;166;226;46:*.dyn_o=0;38;2;122;112;112:*.xhtml=0;38;2;226;209;57:*.cabal=0;38;2;0;255;135:*.scala=0;38;2;0;255;135:*.toast=4;38;2;249;38;114:*shadow=0;38;2;166;226;46:*.class=0;38;2;122;112;112:*.patch=0;38;2;0;255;135:*.shtml=0;38;2;226;209;57:*.ipynb=0;38;2;0;255;135:*README=0;38;2;0;0;0;48;2;230;219;116:*.cache=0;38;2;122;112;112:*.swift=0;38;2;0;255;135:*TODO.md=1:*.gradle=0;38;2;0;255;135:*.flake8=0;38;2;166;226;46:*.config=0;38;2;166;226;46:*.groovy=0;38;2;0;255;135:*.matlab=0;38;2;0;255;135:*COPYING=0;38;2;182;182;182:*.dyn_hi=0;38;2;122;112;112:*LICENSE=0;38;2;182;182;182:*INSTALL=0;38;2;0;0;0;48;2;230;219;116:*.ignore=0;38;2;166;226;46:*Doxyfile=0;38;2;166;226;46:*Makefile=0;38;2;166;226;46:*TODO.txt=1:*.desktop=0;38;2;166;226;46:*.gemspec=0;38;2;166;226;46:*setup.py=0;38;2;166;226;46:*.cmake.in=0;38;2;166;226;46:*.kdevelop=0;38;2;166;226;46:*.DS_Store=0;38;2;122;112;112:*.fdignore=0;38;2;166;226;46:*COPYRIGHT=0;38;2;182;182;182:*README.md=0;38;2;0;0;0;48;2;230;219;116:*.markdown=0;38;2;226;209;57:*configure=0;38;2;166;226;46:*.rgignore=0;38;2;166;226;46:*.scons_opt=0;38;2;122;112;112:*.gitconfig=0;38;2;166;226;46:*SConscript=0;38;2;166;226;46:*README.txt=0;38;2;0;0;0;48;2;230;219;116:*.localized=0;38;2;122;112;112:*.gitignore=0;38;2;166;226;46:*CODEOWNERS=0;38;2;166;226;46:*Dockerfile=0;38;2;166;226;46:*INSTALL.md=0;38;2;0;0;0;48;2;230;219;116:*SConstruct=0;38;2;166;226;46:*.travis.yml=0;38;2;230;219;116:*INSTALL.txt=0;38;2;0;0;0;48;2;230;219;116:*.synctex.gz=0;38;2;122;112;112:*MANIFEST.in=0;38;2;166;226;46:*LICENSE-MIT=0;38;2;182;182;182:*Makefile.am=0;38;2;166;226;46:*.gitmodules=0;38;2;166;226;46:*Makefile.in=0;38;2;122;112;112:*configure.ac=0;38;2;166;226;46:*CONTRIBUTORS=0;38;2;0;0;0;48;2;230;219;116:*appveyor.yml=0;38;2;230;219;116:*.applescript=0;38;2;0;255;135:*.fdb_latexmk=0;38;2;122;112;112:*.clang-format=0;38;2;166;226;46:*CMakeCache.txt=0;38;2;122;112;112:*LICENSE-APACHE=0;38;2;182;182;182:*CMakeLists.txt=0;38;2;166;226;46:*.gitattributes=0;38;2;166;226;46:*CONTRIBUTORS.md=0;38;2;0;0;0;48;2;230;219;116:*.sconsign.dblite=0;38;2;122;112;112:*CONTRIBUTORS.txt=0;38;2;0;0;0;48;2;230;219;116:*requirements.txt=0;38;2;166;226;46:*package-lock.json=0;38;2;122;112;112:*.CFUserTextEncoding=0;38;2;122;112;112"
    
    # colored GCC warnings and errors
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    # add color in man
    export LESS_TERMCAP_mb=$'\e[01;32m'     # start blink
    export LESS_TERMCAP_md=$'\e[01;32m'     # start bold
    export LESS_TERMCAP_me=$'\e[0m'         # turn off bold, blink and underline
    export LESS_TERMCAP_se=$'\e[0m'         # stop standout
    export LESS_TERMCAP_so=$'\e[01;96m'     # start standout (reverse video)
    export LESS_TERMCAP_ue=$'\e[0m'         # stop underline
    export LESS_TERMCAP_us=$'\e[1;4;31m'    # start underline

else
    PS1='┌─[\t]─[\$?]─[\u@\h]─[\W]\n└──╼ \$ '
    ART="$ART\n"
fi

unset neon red lpurple trd reset yellow lwhite t x n p use_color

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    # add color to command
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

#-----------------------------------------------------------------------#
#                                                                       #
#                             Alias section                             #
#                                                                       #
#-----------------------------------------------------------------------#

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# usefull alias
alias brc='code ~/.bashrc'      # open all bashrc related files
alias rbrc='source ~/.bashrc'   # reload bashrc
alias cp='cp -i'                # cp with confirm
alias df='df -h'                # human-readable sizes
alias free='free -m'            # show sizes in MB
alias home='cd ~'               # go to $HOME
alias h='cd ~'                  # go to $HOME
alias r='cd /'                  # go to root

# debug for color text
alias escapecolor='sed -r "s/\x1B(\[([0-9]{1,3}(;[0-9]{1,2}){0,3})?[mGK])/\x1B\1\\\e\1\e\x1B[0m/g"'
alias wprint='sed -e "s/\/mnt\/c\//C:\//g"'

# useless alias
alias meow='cat'                # alias cat
alias please='sudo'             # sudo alias
alias fucking='sudo'            # sudo alias

# Back to the futur
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Lisp alias
alias lisp='sbcl --script'
alias ilisp='sbcl'

# Python alias
alias pipupall='pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'

# Tools alias
alias bfg='java -jar ~/bin/bfg/bfg.jar'
alias bat='batcat'
alias ghidra='~/bin/ghidra/ghidraRun &'

# resolve lastest python
maxversion="0"
for version in $(/bin/ls /usr/bin/python3.* | /bin/egrep -o '[0-9][0-9]?$')
do
    if [ "$maxversion" -lt "$version" ]; then
        maxversion="$version"
    fi
done
if [ "$maxversion" -eq "0" ]; then
    if command -v python3 &> /dev/null; then 
        alias py='python3'
    else
        alias py='python'
    fi
else
    alias py="/usr/bin/python3.$maxversion"
fi
unset maxversion

# Bat theme
export BAT_THEME="Monokai Extended"


#-----------------------------------------------------------------------#
#                                                                       #
#                            Script section                             #
#                                                                       #
#-----------------------------------------------------------------------#

# upgrade many thing
update() {
    _update() {
        printbar; echo "Update system ..."; printbar
        sudo apt -y update
        printbar; echo "Upgrade system ..."; printbar
        sudo apt -y upgrade
        printbar; echo "Upgrade pip ..."; printbar
        pip install -U pip
        printbar
        echo "Done !"
    }
    time _update
}

# clean way to print 
env() {
    $(which env) $@ | escapecolor
}

# compile asm code
asm() {
    if [ $# -ne 1 ]; then
        echo "SYNTAXE : $0 OUTPUT"
    fi
    src="$1"
    name="$(basename ${src%.*})"
    gcc -c -gdwarf "$src" -o "$name.o" && ld -s -o "$name" "$name.o" && "./$name"
    rm -rf "$name.o"
}

# clean way to print 
printenv() {
    $(which printenv) $@ | escapecolor
}

# restart kde gui
rkde() {
    if command -v plasmashell &> /dev/null; then
        export DISPLAY=:0
        echo "[+] kquitapp5 plasmashell"
        DISPLAY=:0 kquitapp5 plasmashell &> /dev/null
        echo "[+] killall plasmashell"
        DISPLAY=:0 killall plasmashell &> /dev/null
        echo "[+] sleep 2 sec ..."
        sleep 2
        echo "[+] kstart5 plasmashell"
        DISPLAY=:0 kstart5 plasmashell &> /dev/null
        sleep 3
        echo "Done !"
    else 
        echo "Not supported"
    fi
}


# run jupyter-notebook
jpy() {
    if ! command -v jupyter-notebook &> /dev/null; then
        echo "Jupiner not installed"
        exit 1
    fi
    source activate
    jupyter-notebook
    source deactivate
}

# remove all pycache
pyclean () {
    if [ $# -eq 0 ]; then
        paths="$PWD"
    else
        paths="$@"
    fi
    for path in "$paths"
    do
        echo "Cleaning $path ..."
        find "$path" \
            -type f -name '*.py[co]' -delete -o \
            -type d -name __pycache__ -delete
    done
}

# Create a folder and move into it
mkcd() {
    if [ $# -ne 1 ]; then
        echo "SYNTAXE : $0 DIR"
    fi
    mkdir -p -- "$1" && cd -P -- "$1"
}

#welcome message
welcome() {
    if [ $# -ne 0 ]; then
        echo "SYNTAXE : $0"
    fi
    printf "$ART"
}

# clear and show welcome
clear() {
    if [ $# -ne 0 ]; then
        echo "SYNTAXE : $0"
    fi
    $(which clear)
    $(which clear)
    welcome
}

# print paths
ppath() {
    if [ "$#" -ne "0" ]; then
        echo "SYNTAXE : $0"
    fi
    sed 's/:/\n/g' <<< "$PATH"
}

color() {
    if [ $# -ne 0 ]; then
        echo "SYNTAXE : $0"
    fi

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}T\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mB\e[m"
        done
        echo; echo
    done
}

gitinfo() {
    if [ -z "$1" ]; then
        git shortlog -sn
    else 
        git log --shortstat --author="$1" \
        | grep -E "fil(e|es) changed" \
        | awk '{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END {printf "Commit stats:\n- Files changed (total)..  %s\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }' -
    fi
}

# Extract archive
ex () {
    if [ "$#" -ne 1 ]; then
        echo "SYNTAXE : ex FILE"
        return 1
    fi
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.tar.xz)    tar xf "$1"    ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.jar)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *.deb)       ar x "$1"      ;;
            *)           echo "'$1' cannot be extracted via ex" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Print a bar of the terminal size
printbar() {
    if [ $# -eq 0 ]; then
        c='─'
    elif [ $# -eq 1 ]; then
        c="$1"
    else
        echo "SYNTAXE : $0 [CHARS]"
        return 1
    fi

    len=$(($(tput cols) / ${#c}))
    rest=$(($(tput cols) - $len * ${#c} ))
    barspace=$(printf "%${len}s")
    suffix=

    if [ $rest -ne 0 ]; then
        suffix=$(echo "$c" | cut "-c-$rest")
    fi
    bar="${barspace// /$c}$suffix"
    echo "$bar"
    return 0
}

# Compile and run c programs
toc() {
    # Missing positional argument
    if [ "$#" -eq 0 ]; then
        path="$PWD"
    elif [ "$#" -eq 1 ]; then
        path=$(realpath "$1")
        if [ $? -ne 0 ]; then
            echo "Invalid path"
            return 1
        fi
    else
        echo "SYNTAXE $0 [OPTINAL PATH]"
        return 1
    fi

    if [ -d "$path" ]; then
        echo "Recursive toc : $path"
        err=0
        underpaths=$(ls -d -1 "$path/"* 2> /dev/null)
        if [ $? -ne 0 ]; then
            return 2
        fi

        for underpath in $underpaths; do
            if [[ -f "$underpath" ]] && [[ $underpath == *".c" ]] || [ -d "$underpath" ]; then
                toc "$underpath"
                exittoc=$?
                if [ $exittoc -ne 0 ]; then
                    err=2
                fi
            fi
        done
        return $err
    elif [ ! -f "$path" ]; then
        echo "Not a File"
        return 3
    elif [[ $path != *".c" ]]; then
        echo "Not a C file"
        return 4
    fi

    # Show informations
    echo "Input : $path"

    name="$(basename ${path%.*})"
    dirname=${path%/*}
    mkdir -p -- "$dirname/out/"
    outpath="$dirname/out/$name"
    echo "Output : $outpath"

    chars=$(wc -c $path)
    chars=${chars% *}
    echo "Compiling $chars bytes ..."

    # GCC FLAGS
    # -Wredundant-decls         duplicate statement.
    # -Wformat-security         wrong format function.
    # -Wformat-signedness       wrong format function about the sign.
    # -Werror                   Make all warnings into errors.
    # -Wextra                   Add more warning
    # -Wall                     Add more Warning
    # -Wshadow                  Warning already defined var
    # -Wdouble-promotion        Warning implicit cast of float to double
    # -Wfloat-equal             Warning on float comparaison
    # -Wpedantic                Add warnings
    # -pedantic-errors          Add errors
    # -fverbose-asm             Add source message to file for gdb
    # -gdwarf                   Add source to out file for debug for gdb
    # -fsanitize=leak           Show memory leak
    # -fno-stack-protector      Remove stack protector
    # -O0                       Remove optimization

    # Compilation
    gcc "$path" -o "$outpath"  \
        -Wredundant-decls      \
        -Wformat-security      \
        -Wformat-signedness    \
        -Wextra                \
        -O0                    \
        -Wall                  \
        -Wshadow               \
        -Wdouble-promotion     \
        -Wfloat-equal          \
        -Wpedantic             \
        -pedantic-errors       \
        -fverbose-asm          \
        -gdwarf                \
        -fsanitize=leak        \
    && 

    exitgcc="$?"
    if [ $exitgcc -ne 0 ]; then
        echo "GCC exit code was $exitgcc"
        return 5
    fi

    # Run program
    chars=$(wc -c $outpath)
    chars=${chars% *}
    echo "Compiled into $chars bytes ..."
    echo "Running ..."
    printbar
    
    # run program
    $outpath
    exitexec="$?"

    # Check exit code
    if [ $exitexec -eq 0 ]; then
        printbar
        return 0
    fi

    echo
    printbar

    if [ $exitexec -gt 128 ]; then
        # Show informations about exit code
        echo "Process was terminated abnormally"
        val=$(($exitexec-128))
        case $val in
            2) echo "SIGINT : Interrupt from the keyboard." ;;
            3) echo "SIGQUIT : Request 'Exit' from the keyboard." ;;
            4) echo "SIGILL : Illegal instruction." ;;
            5) echo "SIGTRAP : Breakpoint encountered." ;;
            6) echo "SIGABRT : Stop signal from abort." ;;
            8) echo "SIGFPE : Floating point math error." ;;
            9) echo "SIGKILL : Signal 'KILL'." ;;
            11) echo "SIGSEGV : Invalid memory reference." ;;
            20) echo "SIGTSTP : CTRL + Z." ;;
            *) echo "Unknow signal $val" ;;
        esac
        printbar
        return 6

    else
        echo "Program exit code $exitexec"
        printbar
        return 7
    fi
}

errgrep() {
    errno_txt=$(cat <<EOF
  1   EPERM             Operation not permitted
  2   ENOENT            No such file or directory
  3   ESRCH             No such process
  4   EINTR             Interrupted system call
  5   EIO               Input/output error
  6   ENXIO             No such device or address
  7   E2BIG             Argument list too long
  8   ENOEXEC           Exec format error
  9   EBADF             Bad file descriptor
 10   ECHILD            No child processes
 11   EAGAIN            Resource temporarily unavailable
 11   EWOULDBLOCK       Resource temporarily unavailable
 12   ENOMEM            Cannot allocate memory
 13   EACCES            Permission denied
 14   EFAULT            Bad address
 15   ENOTBLK           Block device required
 16   EBUSY             Device or resource busy
 17   EEXIST            File exists
 18   EXDEV             Invalid cross-device link
 19   ENODEV            No such device
 20   ENOTDIR           Not a directory
 21   EISDIR            Is a directory
 22   EINVAL            Invalid argument
 23   ENFILE            Too many open files in system
 24   EMFILE            Too many open files
 25   ENOTTY            Inappropriate ioctl for device
 26   ETXTBSY           Text file busy
 27   EFBIG             File too large
 28   ENOSPC            No space left on device
 29   ESPIPE            Illegal seek
 30   EROFS             Read-only file system
 31   EMLINK            Too many links
 32   EPIPE             Broken pipe
 33   EDOM              Numerical argument out of domain
 34   ERANGE            Numerical result out of range
 35   EDEADLK           Resource deadlock avoided
 35   EDEADLOCK         Resource deadlock avoided
 36   ENAMETOOLONG      File name too long
 37   ENOLCK            No locks available
 38   ENOSYS            Function not implemented
 39   ENOTEMPTY         Directory not empty
 40   ELOOP             Too many levels of symbolic links
 42   ENOMSG            No message of desired type
 43   EIDRM             Identifier removed
 44   ECHRNG            Channel number out of range
 45   EL2NSYNC          Level 2 not synchronized
 46   EL3HLT            Level 3 halted
 47   EL3RST            Level 3 reset
 48   ELNRNG            Link number out of range
 49   EUNATCH           Protocol driver not attached
 50   ENOCSI            No CSI structure available
 51   EL2HLT            Level 2 halted
 52   EBADE             Invalid exchange
 53   EBADR             Invalid request descriptor
 54   EXFULL            Exchange full
 55   ENOANO            No anode
 56   EBADRQC           Invalid request code
 57   EBADSLT           Invalid slot
 59   EBFONT            Bad font file format
 60   ENOSTR            Device not a stream
 61   ENODATA           No data available
 62   ETIME             Timer expired
 63   ENOSR             Out of streams resources
 64   ENONET            Machine is not on the network
 65   ENOPKG            Package not installed
 66   EREMOTE           Object is remote
 67   ENOLINK           Link has been severed
 68   EADV              Advertise error
 69   ESRMNT            Srmount error
 70   ECOMM             Communication error on send
 71   EPROTO            Protocol error
 72   EMULTIHOP         Multihop attempted
 73   EDOTDOT           RFS specific error
 74   EBADMSG           Bad message
 75   EOVERFLOW         Value too large for defined data type
 76   ENOTUNIQ          Name not unique on network
 77   EBADFD            File descriptor in bad state
 78   EREMCHG           Remote address changed
 79   ELIBACC           Can not access a needed shared library
 80   ELIBBAD           Accessing a corrupted shared library
 81   ELIBSCN           .lib section in a.out corrupted
 82   ELIBMAX           Attempting to link in too many shared libraries
 83   ELIBEXEC          Cannot exec a shared library directly
 84   EILSEQ            Invalid or incomplete multibyte or wide character
 85   ERESTART          Interrupted system call should be restarted
 86   ESTRPIPE          Streams pipe error
 87   EUSERS            Too many users
 88   ENOTSOCK          Socket operation on non-socket
 89   EDESTADDRREQ      Destination address required
 90   EMSGSIZE          Message too long
 91   EPROTOTYPE        Protocol wrong type for socket
 92   ENOPROTOOPT       Protocol not available
 93   EPROTONOSUPPORT   Protocol not supported
 94   ESOCKTNOSUPPORT   Socket type not supported
 95   ENOTSUP           Operation not supported
 95   EOPNOTSUPP        Operation not supported
 96   EPFNOSUPPORT      Protocol family not supported
 97   EAFNOSUPPORT      Address family not supported by protocol
 98   EADDRINUSE        Address already in use
 99   EADDRNOTAVAIL     Cannot assign requested address
100   ENETDOWN          Network is down
101   ENETUNREACH       Network is unreachable
102   ENETRESET         Network dropped connection on reset
103   ECONNABORTED      Software caused connection abort
104   ECONNRESET        Connection reset by peer
105   ENOBUFS           No buffer space available
106   EISCONN           Transport endpoint is already connected
107   ENOTCONN          Transport endpoint is not connected
108   ESHUTDOWN         Cannot send after transport endpoint shutdown
109   ETOOMANYREFS      Too many references: cannot splice
110   ETIMEDOUT         Connection timed out
111   ECONNREFUSED      Connection refused
112   EHOSTDOWN         Host is down
113   EHOSTUNREACH      No route to host
114   EALREADY          Operation already in progress
115   EINPROGRESS       Operation now in progress
116   ESTALE            Stale file handle
117   EUCLEAN           Structure needs cleaning
118   ENOTNAM           Not a XENIX named type file
119   ENAVAIL           No XENIX semaphores available
120   EISNAM            Is a named type file
121   EREMOTEIO         Remote I/O error
122   EDQUOT            Disk quota exceeded
123   ENOMEDIUM         No medium found
124   EMEDIUMTYPE       Wrong medium type
125   ECANCELED         Operation canceled
126   ENOKEY            Required key not available
127   EKEYEXPIRED       Key has expired
128   EKEYREVOKED       Key has been revoked
129   EKEYREJECTED      Key was rejected by service
130   EOWNERDEAD        Owner died
131   ENOTRECOVERABLE   State not recoverable
132   ERFKILL           Operation not possible due to RF-kill
133   EHWPOISON         Memory page has hardware error
EOF
)
    if [ $# -eq 0 ]; then
        echo "$errno_txt"
    else
        echo "$errno_txt" | grep "$@"
    fi

    return 0
}


#-----------------------------------------------------------------------#
#                                                                       #
#                        Load external aliases                          #
#                                                                       #
#-----------------------------------------------------------------------#

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#-----------------------------------------------------------------------#
#                                                                       #
#                            Others section                             #
#                                                                       #
#-----------------------------------------------------------------------#
