export CLICOLOR=1
export WORK=~/Workspace
alias cdw='cd $WORK'
alias cdh='cd ~'
alias la='ls -a'
alias tag='ctags -R --extra=f .'
alias tagcpp='ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .'
alias gvim='mvim'

cstag() {
  rm -f cscope.files
  echo Creating list of files in system ...
  find $PWD -name '*.[chlyCGHL]' -print > cscope.files
  find $PWD -name '*.cpp' -print >> cscope.files
  find $PWD -name '*.hh' -print >> cscope.files
  echo Building Cscope database ...
  cscope -bi cscope.files
  CSCOPE_DB=$PWD/cscope.out
  export CSCOPE_DB
}

# MacPorts Installer addition on 2014-10-17_at_11:24:08: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
