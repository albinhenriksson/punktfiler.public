#shellcheck shell=bash
#==============================================================================#
#           FIL:  ~/.bashrc                                                    #
#                                                                              #
#   BESKRIVNING:  Zsh-konfiguration för MAKROLIT under EndeavourOS.            #
#                                                                              #
#       SKAPARE:  Albin A. Henriksson                                          #
#       VERSION:  2025-02-06                                                   #
#==============================================================================#
#shellcheck disable=SC2207

## If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Inställningar ----------------------------------------------------------------

## Extra space on the right side of right prompt.
export ZLE_RPROMPT_INDENT=0

## Ladda om nya binärer i PATH automatiskt.
zstyle ':completion:*' rehash true

## GPG-nyckel
export GPG_TTY=$(tty)

## Favorit-editor
if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='micro'
  export EDITOR="micro"
else
  #export EDITOR='micro'
  export EDITOR="micro"
fi

## Historik
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

## import new commands from the history file also in other zsh-session
setopt share_history

## save each command's beginning timestamp and the duration to the history file
setopt extended_history

## Remove command lines from the history list when the first character on the
## line is a space.
setopt histignorespace

# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

## In order to use #, ~ and ^ for filename generation grep word
## *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
## don't forget to quote '^', '~' and '#'!
setopt extended_glob

## display PID when suspending processes as well
setopt longlistjobs

## report the status of backgrounds jobs immediately
setopt notify

## whenever a command completion is attempted, make sure the entire command path
## is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

## Don't send SIGHUP to background processes when the shell exits.
setopt nohup

## make cd push the old directory onto the directory stack.
setopt auto_pushd

## avoid "beep"ing
setopt nobeep

## don't push the same dir twice.
setopt pushd_ignore_dups

## * shouldn't match dotfiles. ever.
setopt noglobdots

## use zsh style word splitting
setopt noshwordsplit

# don't error out when unset parameters are used
setopt unset

# Miljövariabler ---------------------------------------------------------------

## SSH-agent.
## [https://wiki.archlinux.org/title/GNOME/Keyring#SSH_keys]
##
## GNOME Keyring can act as a wrapper around ssh-agent. In that mode, it will
## display a GUI password entry dialog each time you need to unlock an SSH key.
## The dialog includes a checkbox to remember the password you type, which, if
## selected, will allow fully passwordless use of that key in the future as long
## as your login keyring is unlocked.
##
## The SSH functionality is disabled by default in gnome-keyring-daemon builds
## since version 1:46. It has been moved into /usr/lib/gcr-ssh-agent, which is
## part of the gcr-4 package.
##
## All you need to do is
##
##    1. Enable the gcr-ssh-agent.socket systemd user unit.
##        systemctl --user enable gcr-ssh-agent.socket
##    Run SSH commands with the "SSH_AUTH_SOCK" environment variable set to 
##    "$XDG_RUNTIME_DIR/gcr/ssh".
#export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
##
## (https://wiki.archlinux.org/title/SSH_keys#SSH_agents)
## (https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user)
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Färger -----------------------------------------------------------------------

## Färggladheter från .bashrc (Kubuntu).
# shellcheck disable=SC2015
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

## Färgglad diff.
alias diff="diff --color=auto"

## Färgglada GCC-varningar/errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Syntaxmarkering i "less" (alternativ 1/2).
export LESSOPEN="| /usr/bin/source-highlight %s"
export LESS='-R '

## Färger i RadeonTop.
alias radeontop="radeontop --color"

## Fyll manualer med färg!
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Pseudonymer ------------------------------------------------------------------
alias c=clear # Sudda ut och spola tillbaka.

alias hitta_oppna_portar="sudo lsof -i -P -n | grep LISTEN" # Visa öppna nätverksportar.

alias rakna_filer_i_mapp='find . -type f | wc -l' # Räkna antal filer i mappar.

alias rakna_rader_i_fil="wc --lines < " # Räkna antalet rader i en fil.

alias rakna_tecken_i_fil="wc --chars < " # Räkna antalet tecken i en fil.

alias rakna_ord_i_fil="wc --words < " # Räkna antalet ord i en fil.

alias untar="tar -zxvf " # Packa upp ett tar:at arkiv utan dubbeldyslexi.

alias wget="wget -c" # Fortsätt nedladdning med wget som standard.

alias datum='date +"%Y-%m-%d"' # Dagens datum.

## SSH-uppkoppling mot arkeisk Cisco-utrustning.
alias ssh_cisco="ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c aes256-cbc"

## Exa
alias l='eza \
           --color=always \
           --color-scale \
           --time-style=long-iso \
           --group-directories-first \
           --header \
           --classify \
           --no-permissions \
           --octal-permissions'

alias ll='l \
            --long \
            --all'

## Filhantering (tydlighet och utökade filattribut)
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'

### (https://wiki.archlinux.org/title/Extended_attributes#Preserving_extended_attributes)
### (https://www.reddit.com/r/linuxquestions/comments/xogt66/what_purpose_does_extended_attributes_have)
### (https://en.wikipedia.org/wiki/Extended_file_attributes)
### XATTR sparas som default bara av "mv" - men inte av cp eller rsync.
###
### Extended attributes (xattr) are name:value pairs associated permanently with
### files and directories. There are four extended attribute classes:
###
###   1. security
###   2. system
###   3. trusted
###   4- user
###
#alias cp='cp -v --preserve=xattr'
#alias cp='cp -v --preserve=all'

## Mät bredbandshastighet
alias bbk="bbk_cli"
alias bredbandskollen="bbk"

## Arkivera kultur.
alias ö='hämta-video'

## Visa bilder ordentligt.
alias feh='feh \
             --recursive \
             --borderless \
             --auto-zoom \
             --cache-size 2048 \
             --cache-thumbnails \
             --auto-rotate \
             --edit \
             --image-bg "black" \
             --preload \
             --on-last-slide hold \
             --scale-down'

# Funktioner -------------------------------------------------------------------

## Packa upp typ nästan alla olika sorters filformat
function extrahera() {
  if [ -z "$1" ]; then
    # Om man inte skickar in variabel, visa help-text.
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zst>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
    for n in "$@"; do
      if [ -f "$n" ]; then
        case "${n%,}" in
          *.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
            tar xvf "$n"
            ;;
          *.lzma) unlzma ./"$n" ;;
          *.bz2) bunzip2 ./"$n" ;;
          *.cbr | *.rar) unrar x -ad ./"$n" ;;
          *.gz) gunzip ./"$n" ;;
          *.cbz | *.epub | *.zip) unzip ./"$n" ;;
          *.z) uncompress ./"$n" ;;
          *.7z | *.apk | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
            7z x ./"$n"
            ;;
          *.xz) unxz ./"$n" ;;
          *.zst) zstd -d ./"$n" ;;
          *.exe) cabextract ./"$n" ;;
          *.cpio) cpio -id <./"$n" ;;
          *.cba | *.ace) unace x ./"$n" ;;
          *.zpaq) zpaq x ./"$n" ;;
          *.arc) arc e ./"$n" ;;
          *.cso) ciso 0 ./"$n" ./"$n.iso" &&
            extract "$n.iso" && \rm -f "$n" ;;
          *)
            echo "extract: '$n' - unknown archive method"
            return 1
            ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

## Kombinera bat med git-diff för linjer, färger och magi
batdiff() {
  git diff --name-only --diff-filter=d | xargs bat --diff
}

## Kopiera med rsync
function cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --xattrs "$@"
}

## Flytta med rsync
function mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files --xattrs "$@"
}

## Kör ett kommando i ett nytt fönster.
tmux-nytt-fönster() (tmux split-window -dh -t "$TMUX_PANE" "zsh --rcfile <(echo '. ~/.bashrc;$*')")

## Ladda ned en film från det stora nätet.
function hämta-video() {
    tmux split-window -dh -t "$TMUX_PANE" "yt-dlp \"$1\"" && tmux select-layout tiled
}

# Skalkomplettering ------------------------------------------------------------

## Automatisk komplettering
autoload -Uz compinit promptinit
compinit
promptinit

## Autocompletion with an arrow-key driven interface.
zstyle ':completion:*' menu select

## Autocompletion of privileged environments in privileged commands.
zstyle ':completion::complete:*' gain-privileges 1

## Skalkomplettering för pip3.
#compdef -P pip[0-9.]#
__pip() {
compadd $( COMP_WORDS="$words[*]" \
COMP_CWORD=$((CURRENT-1)) \
PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null )
}
if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
# autoload from fpath, call function directly
__pip "$@"
else
# eval/source/. command, register function for later
compdef __pip -P 'pip[0-9.]#'
fi

# Tangentbord -----------------------------------------------------------------

## (https://wiki.archlinux.org/title/Zsh#Key_bindings).
## The recommended way to set key bindings in Zsh is by using string capabilities from terminfo.
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

## Enable history search
## (https://wiki.archlinux.org/title/Zsh#History_search).
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


## Ctrl+Left to move to the beginning of the previous word and Ctrl+Right to move to the beginning of the next word.
## (https://wiki.archlinux.org/title/Zsh#Shift,_Alt,_Ctrl_and_Meta_modifiers).
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

## Resetting the terminal with escape sequences.
## (https://wiki.archlinux.org/title/Zsh#Resetting_the_terminal_with_escape_sequences).
autoload -Uz add-zsh-hook

function reset_broken_terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

add-zsh-hook -Uz precmd reset_broken_terminal

# Källinläsning ----------------------------------------------------------------
#shellcheck disable=SC1094
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
#shellcheck disable=SC1094
source "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
#shellcheck disable=SC1094
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

## (https://ohmyposh.dev/docs/installation/prompt)
## Add the following snippet as the last line to ~/.zshrc:
#eval "$(oh-my-posh init zsh)"
