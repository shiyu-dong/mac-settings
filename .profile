export CLICOLOR=1
export WORK=~/Workspace
alias cdw='cd $WORK'
alias cdh='cd ~'
alias la='ls -a'
alias tag='ctags -R --extra=f .'
alias tagcpp='ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .'
alias gvim='mvim'
alias gdb='ggdb'

# MacPorts Installer addition on 2014-10-17_at_11:24:08: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
