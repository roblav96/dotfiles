export DH="$HOME/repos/dochub"

alias dh="cd $DH"
alias dhf="cd $DH/frontend"
alias dhup="brew services restart mysql; brew services restart redis; brew services list"
alias dhdown="brew services stop mysql; brew services stop redis; brew services list"
alias dhsidekiq="cd $DH; bundle exec sidekiq | sedbat"
alias dhrails="cd $DH; rails server"
alias dhember="cd $DH/frontend; ember serve"
