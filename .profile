export CLICOLOR=1
export WORK=$HOME/Dropbox/workspace
export WORK2=$HOME/Workspace
export EDITOR=vim
alias vi='vim'
alias la='ls -a'
alias tag='ctags -R --extra=f .'
alias tagcpp='ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .'
alias b='cd ..'
alias b1='cd ..'
alias b2='cd ../..'
alias b3='cd ../../..'
alias b4='cd ../../../..'
alias b5='cd ../../../../..'

alias chnex='find -type f \( -iname \*.c -o -iname \*.cpp -o -iname \*.h \) -exec chmod -x \{\} \;'
alias rts='find -type f \( -iname \*.c -o -iname \*.cpp -o -iname \*.h \) -print0 | xargs -0 sed -i '' -E "s/[[:space:]]*$//" '

cdw() {
    if [ -d "$WORK" ]; then
        cd "$WORK"
    elif [ -d "$WORK2" ]; then
        cd "$WORK2"
    fi
}

backup_photos() {
    rsync -av --delete ~/Pictures/Photos /Volumes/NTFS
    rsync -av --delete ~/Pictures/Photos /Volumes/Photos
    rsync -av --delete ~/Pictures/Lightroom/Lightroom\ Catalog-2.lrcat /Volumes/NTFS/Photos
    rsync -av --delete ~/Pictures/Lightroom/Lightroom\ Catalog-2.lrcat /Volumes/Photos
}

# Git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

# setup a decent prompt
myName=`/usr/libexec/PlistBuddy -c "Print :System:System:ComputerName" /Library/Preferences/SystemConfiguration/preferences.plist`
PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]$(__git_ps1 "[\[\e[33m\]%s\[\e[0m\]]")`if [ \$? = 0 ]; then echo $; else echo \[\e[31m\]%\[\e[0m\];fi;` '
PS2="Continue> "

