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
    -nNT -L 14834:localhost:14834 \
    -nNT -L 18366:localhost:18366 \
    -nNT -L 14765:localhost:14765 \
    -nNT -L 16802:localhost:16802 \
    -nNT -L 14542:localhost:14542 \
    -nNT -L 16439:localhost:16439 \
    -nNT -L 5436:localhost:5436 \
    compute2000-sjc1
}

# Git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

# setup a decent prompt
myName=`/usr/libexec/PlistBuddy -c "Print :System:System:ComputerName" /Library/Preferences/SystemConfiguration/preferences.plist`
PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]$(__git_ps1 "[\[\e[33m\]%s\[\e[0m\]]")`if [ \$? = 0 ]; then echo $; else echo \[\e[31m\]%\[\e[0m\];fi;` '
PS2="Continue> "

# Setting PATH
PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:${PATH}:/usr/local/octave/3.8.0/bin"
export PATH
