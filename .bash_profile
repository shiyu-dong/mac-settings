export CLICOLOR=1
export COURSE=~/Dropbox/UT/Courses/14Spring
export RESEARCH=~/Dropbox/UT/Research
export WORK=~/Workspace
alias cdw='cd $WORK'
alias cdh='cd ~'
alias cdc='cd $COURSE'
alias cdr='cd $RESEARCH'
alias la='ls -a'
alias tag='ctags -R --extra=f .'
alias tagcpp='ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .'
alias gvim='mvim'
alias gdb='ggdb'

##
# Your previous /Users/Shiyu/.bash_profile file was backed up as /Users/Shiyu/.bash_profile.macports-saved_2013-04-22_at_00:37:37
##

# MacPorts Installer addition on 2013-04-22_at_00:37:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
