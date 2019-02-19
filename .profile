export CLICOLOR=1
export WORK=$HOME/Dropbox/Workspace/
export WORK2=$HOME/Workspace
export WORK3=$HOME/Uber
export EDITOR=vim
export JAVA_HOME=$(/usr/libexec/java_home)
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
    else
        cd "$WORK3"
    fi
}

bucd() {
    ./gradlew ucd:ucd-common:build ucd:ucd-monitor:build ucd:ucd-server:build ucd:ucd-cadence:build
}

cucd() {
    ./gradlew ucd:ucd-common:check ucd:ucd-monitor:check ucd:ucd-server:check ucd:ucd-cadence:check
}

cbucd() {
    ./gradlew clean ucd:ucd-common:build ucd:ucd-monitor:build ucd:ucd-server:build ucd:ucd-cadence:build
}

ccucd() {
    ./gradlew clean ucd:ucd-common:check ucd:ucd-monitor:check ucd:ucd-server:check ucd:ucd-cadence:check
}

jfucd() {
    ./gradlew ucd:ucd-common:goJF ucd:ucd-monitor:goJF ucd:ucd-server:goJF ucd:ucd-cadence:goJF
}

tunnel() {
    ssh \
    -nNT -L 14834:127.0.0.1:14834 \
    -nNT -L 18366:127.0.0.1:18366 \
    -nNT -L 14765:127.0.0.1:14765 \
    -nNT -L 16802:127.0.0.1:16802 \
    -nNT -L 14542:127.0.0.1:14542 \
    -nNT -L 16439:127.0.0.1:16439 \
    -nNT -L 14384:127.0.0.1:14384 \
    -nNT -L 5436:127.0.0.1:5436 \
    -nNT -L 5437:127.0.0.1:5437 \
    compute2000-sjc1
}

tunnelserver() {
    ssh \
    -vL 16257:127.0.0.1:16257 \
    -vL 14834:127.0.0.1:14834 \
    -vL 18366:127.0.0.1:18366 \
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
    compute2000-sjc1
}

# Git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

# setup a decent prompt
myName=`/usr/libexec/PlistBuddy -c "Print :System:System:ComputerName" /Library/Preferences/SystemConfiguration/preferences.plist`
PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]$(__git_ps1 "[\[\e[33m\]%s\[\e[0m\]]")`if [ \$? = 0 ]; then echo $; else echo \[\e[31m\]%\[\e[0m\];fi;` '
PS2="Continue> "

export PATH=/usr/local/sbin:$PATH
# enable this if default to python3
# export PATH=/usr/local/opt/python/libexec/bin:$PATH
