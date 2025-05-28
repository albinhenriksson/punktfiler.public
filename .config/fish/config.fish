source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

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

## (https://github.com/ulyssesrr/docker-rocm-xtra/blob/main/rocm-xtra-dev/README.md)
alias drun='sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $(pwd):/current'


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

## Kopiera med rsync
alias cpr="rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --xattrs"

## Flytta med rsync
alias mvr="rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files --xattrs"

#----

eval (ssh-agent -c) > /dev/null 2>&1

