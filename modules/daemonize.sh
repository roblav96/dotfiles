
alias init.daemonize="daemonize -u nobody -c $HOME -- /usr/bin/env -i HOME=$HOME $(which bash) -l -c"
