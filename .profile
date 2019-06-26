export CLICOLOR=1
export WORK=$HOME/Dropbox/Workspace/
export WORK2=$HOME/Workspace
export WORK3=$HOME/Uber
export EDITOR=vim
export GOPATH=$GOPATH:$HOME/go-code
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
alias cducd='cd ~/Uber/fievel/dev-platform/cicd/ucd'
alias ucd_buck='./buckw project dev-platform/cicd/ucd/...'
alias ucd_test='./buckw test --exclude integration --always-exclude dev-platform/cicd/ucd/...'

alias chnex='find -type f \( -iname \*.c -o -iname \*.cpp -o -iname \*.h \) -exec chmod -x \{\} \;'
alias rts='find -type f \( -iname \*.c -o -iname \*.cpp -o -iname \*.h \) -print0 | xargs -0 sed -i '' -E "s/[[:space:]]*$//" '

cdw() {
    if [ -d "$WORK" ]; then
        cd "$WORK"
    elif [ -d "$WORK2" ]; then
        cd "$WORK2"
    else
        cd "$WORK3"
    fi
}

backup_photos() {
    rsync -av --delete /Volumes/NTFS/Photos /Volumes/Photos
}

tunnel() {
    ssh \
    -nNT -L 14834:127.0.0.1:14834 \
    -nNT -L 14765:127.0.0.1:14765 \
    -nNT -L 16802:127.0.0.1:16802 \
    -nNT -L 14542:127.0.0.1:14542 \
    -nNT -L 16439:127.0.0.1:16439 \
    -nNT -L 14384:127.0.0.1:14384 \
    -nNT -L 5435:127.0.0.1:5435 \
    -nNT -L 5436:127.0.0.1:5436 \
    -nNT -L 5437:127.0.0.1:5437 \
    -nNT -L 14766:127.0.0.1:14766 \
    -nNT -L 14004:127.0.0.1:14004 \
    -nNT -L 16493:127.0.0.1:16493 \
    -nNT -L 16802:127.0.0.1:16802 \
    agent339-phx2
}

tunnelserver() {
    ssh \
    -vL 16257:127.0.0.1:16257 \
    -vL 14834:127.0.0.1:14834 \
    -vL 14300:127.0.0.1:14300 \
    -vL 16746:127.0.0.1:16746 \
    -vL 16498:127.0.0.1:16498 \
    -vL 14766:127.0.0.1:14766 \
    -vL 14765:127.0.0.1:14765 \
    -vL 14542:127.0.0.1:14542 \
    -vL 16521:127.0.0.1:16521 \
    -vL 16802:127.0.0.1:16802 \
    -vL 5436:127.0.0.1:5436 \
    -vL 5437:127.0.0.1:5437 \
    -vL 14384:127.0.0.1:14384 \
    agent5713-phx2
}

# Git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

# setup a decent prompt
myName=`/usr/libexec/PlistBuddy -c "Print :System:System:ComputerName" /Library/Preferences/SystemConfiguration/preferences.plist`
PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]$(__git_ps1 "[\[\e[33m\]%s\[\e[0m\]]")`if [ \$? = 0 ]; then echo $; else echo \[\e[31m\]%\[\e[0m\];fi;` '
PS2="Continue> "

## buck completion for go-monorepo
# source ~/go-code/tooling/buck-completion/buck-completion.bash

export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$GOPATH/bin
# enable this if default to python3
# export PATH=/usr/local/opt/python/libexec/bin:$PATH

brew analytics off 2>&1 >/dev/null
export PATH="/usr/local/opt/thrift@0.9/bin:$PATH"

## buck completion for java-monorepo
# /usr/libexec/java_home -v 1.8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
source /Users/shiyu/.gradle/.gradle/caches/okbuck/buck-completion.bash
