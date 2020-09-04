# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export MYPYPATH="/Applications/Sublime Text.app/Contents/MacOS"
# export PYTHONPATH="/usr/local/lib/python3.7:/usr/local/lib/python3.7/site-packages"
# export PATH="/usr/local/opt/python@2/bin:$PATH"
# export PYTHONPATH="/usr/local/lib/python2.7:/usr/local/lib/python2.7/site-packages"
# export ANDROID_VIEW_CLIENT_HOME="$HOME/Downloads/AndroidViewClient-15.5.1"
# export PYTHONPATH="$HOME/Downloads/AndroidViewClient-15.5.1"
# export PYTHONHOME="$HOME/Downloads/AndroidViewClient-15.5.1"

alias black="black --verbose --fast --line-length 100 --target-version py38"
alias yapf="yapf --style='{ based_on_style: facebook, column_limit: 100, continuation_align_style: FIXED, continuation_indent_width: 4, indent_width: 4, spaces_before_comment: 1, use_tabs: true }'"

# alias pip='pip --target=$HOME/.virtualenv'
alias pips="pip search"
alias pipi="pip show"
alias pipfs="pip show --files"
alias pipin="pip install"
alias piprm="pip uninstall --yes"
alias pipls="pip list --format columns --verbose"
alias pipout="pip list --format columns --outdated"
alias pipupg="pip install --upgrade"
