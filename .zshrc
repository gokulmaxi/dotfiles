# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gokul/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
 # COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose ubuntu flutter)

source $ZSH/oh-my-zsh.sh
source /home/gokul/.local/bin/ros-fun
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
alias nt="cd /media/data/notes"
book(){zathura $(find *.pdf /home/gokul/Documents/books | fzf)}
alias spotify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
# source ~/ros-master.sh
export ROSCONSOLE_FORMAT='${node}:${message}'
# cd projects/ros/flipkart-challenge/
# sws
# alias COD="roslaunch flipbot2_base collision_detector.launch"
# alias FR2="roslaunch flipbot2_base flipkart_round2.launch"

PATH="/home/gokul/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/gokul/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/gokul/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/gokul/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/gokul/perl5"; export PERL_MM_OPT;
alias lugo="sudo"
CP(){
    export CURRENT_CPP=$(find *.c* | fzf )
}
run(){
    if [[ -z "${CURRENT_CPP}" ]]; then
        CP 
    else
        if [[ $CURRENT_CPP == *.c ]]       #  this is the snag
            then
                filename=$CURRENT_CPP
                gcc $CURRENT_CPP -o "${filename%.c}" && ./"${filename%.c}"
        fi

        if [[ $CURRENT_CPP == *.cpp ]]       #  this is the snag
            then
                filename=$CURRENT_CPP
                g++ $CURRENT_CPP -o "${filename%.cpp}" &&  ./"${filename%.cpp}"
        fi
    fi
}
export ANDROID_HOME=$HOME/android
export ANDROID_SDK_ROOT=$HOME/android/
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH
export PATH="$PATH:$HOME/dev/flutter/bin/"
# convert xopp to pdfs automatically
# Auto save PDF for Xournal++
inotxournal (){
    main_dir=/media/data/notes
    # Wait for changes in ANY files inside directory
    inotifywait -r -m --format '%w%f' -e CLOSE_WRITE "$main_dir" |
        while read file_path; do
            # Check file extension
            if [[ "$file_path" =~ .*\.(xopp|xoj) ]]
            then
                # Convert to pdf (overwrite if already exists)
                echo Converting file to pdf: ${file_path};
                xournalpp "${file_path}" -p "${file_path%.*}.pdf";
                echo Saving done.
            fi
        done
}
nte(){
    file=$1
    xournalpp $file &
    echo $1| entr xournalpp $1 -p "${file%.*}.pdf"
}
em(){
    file=$1
    (emacsclient27 -c ${file} &)
}
export TURTLEBOT3_MODEL=burger
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
