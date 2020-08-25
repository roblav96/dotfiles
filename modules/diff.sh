alias diffs="icdiff --highlight --line-numbers --unified=3"
alias diffc='diff <($(fc -ln -1 -1)) <($(fc -ln -2 -2)) | diffr'

alias checksum="sha256sum"; compdef checksum=rm
