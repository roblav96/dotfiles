export DH="$HOME/repos/dochub"

alias dh="cd $DH"
alias dhf="cd $DH/frontend"
alias dhup="brew services restart mysql; brew services restart redis; brew services list"
alias dhdown="brew services stop mysql; brew services stop redis; brew services list"
alias dhsidekiq="bundle exec sidekiq | sedbat"
alias dhrails="rails server"
alias dhember="ember serve"
