# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git brew colored-man-pages macos docker docker-compose docker-machine samtools bedtools conda-zsh-completion zsh-syntax-highlighting) 

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

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
 export ARCHFLAGS="-arch arm64"

#######################
#!!!!!!!!!!!!!!!!!!!!!#
#######################
#
#Aliases for Rosetta/ARM
# Alias for ARM terminal
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
# Alias for x86/Rosetta
alias rosetta="env /usr/bin/arch -x86_64 /bin/zsh --login" 
#
#######################
#!!!!!!!!!!!!!!!!!!!!!#
#######################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rest="exec zsh"
# alias to make pip work
#alias pip="pip3"
#
# this alias is to make deactivating conda super ezpz
alias deconda="conda deactivate"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOME/scripts/:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=/opt/homebrew/opt/openjdk/bin:/Users/michaelfoster/scripts/:/opt/homebrew/Caskroom/miniconda/base/condabin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/michaelfoster/bin:~/bin:/usr/local/include:/usr/local/lib:/Users/michaelfoster/bin/bbtools
#
#
#
#
#
##   __     __   __           ___
##  |__) | /  \ /__` \ / |\ |  |   /\  \_/
##  |__) | \__/ .__/  |  | \|  |  /~~\ / \
##  =======================================
##
## Syntax Highlighting for computational biology rc.append
## v0.1
##
## Append this to your ~/.zshrc & ~/.bashrc
## to enable source-highlight for less and add
## bioSyntax pipe capability on your command line
##
export HIGHLIGHT="$HOME/.local/share/source-highlight"
export LESSOPEN="| $HIGHLIGHT/src-hilite-lesspipe-bio-MAC.sh %s"
export LESS=" -R "

alias less='less -NSi -# 10'
#	-N: add line numbers
#	-S: don't wrap lines (force to single line)
#	-# 10: Horizontal scroll distance

# Explicit call of  <file format>-less for piping data
# i.e:  samtools view -h aligned_hits.bam | sam-less
# Core syntaxes (default)
alias clustal-less='source-highlight -f esc --lang-def=$HIGHLIGHT/clustal.lang --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/fasta.style | less'
alias bed-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/bed.lang     --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/sam.style   | less'
alias fa-less='source-highlight      -f esc --lang-def=$HIGHLIGHT/fasta.lang   --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/fasta.style | less'
alias fq-less='source-highlight      -f esc --lang-def=$HIGHLIGHT/fastq.lang   --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/fasta.style | less'
alias gtf-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/gtf.lang     --outlang-def=$HIGHLIGHT/bioSyntax-vcf.outlang --style-file=$HIGHLIGHT/vcf.style   | less'
alias pdb-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/pdb.lang     --outlang-def=$HIGHLIGHT/bioSyntax-vcf.outlang --style-file=$HIGHLIGHT/pdb.style   | less'
alias sam-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/sam.lang     --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/sam.style   | less'
alias vcf-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/vcf.lang     --outlang-def=$HIGHLIGHT/bioSyntax-vcf.outlang --style-file=$HIGHLIGHT/vcf.style   | less'
alias bam-less='sam-less'

# Auxillary syntaxes (uncomment to activate)
alias fai-less='source-highlight      -f esc --lang-def=$HIGHLIGHT/faidx.lang    --outlang-def=$HIGHLIGHT/bioSyntax.outlang   --style-file=$HIGHLIGHT/sam.style   | less'
alias flagstat-less='source-highlight -f esc --lang-def=$HIGHLIGHT/flagstat.lang --outlang-def=$HIGHLIGHT/bioSyntax.outlang   --style-file=$HIGHLIGHT/sam.style   | less'

export PATH=$PATH:/Users/michaelfoster/bin/bin


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/michaelfoster/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/michaelfoster/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/michaelfoster/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/michaelfoster/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

