# /usr/local/opt/python@3.9/bin
# /usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin
# /usr/local/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/bin
# /usr/local/opt/python@3.7/Frameworks/Python.framework/Versions/3.7/bin

# [[ -z "$PATH" ]] && export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# [[ -z "$MYPYPATH" ]] && export MYPYPATH="/Applications/Sublime Text.app/Contents/MacOS"
# [[ -z "$PYTHONPATH" ]] && export PYTHONPATH="/usr/local/lib/python3.7:/usr/local/lib/python3.7/site-packages"
# [[ -z "$PATH" ]] && export PATH="/usr/local/opt/python@2/bin:$PATH"
# [[ -z "$PYTHONPATH" ]] && export PYTHONPATH="/usr/local/lib/python2.7:/usr/local/lib/python2.7/site-packages"
# [[ -z "$ANDROID_VIEW_CLIENT_HOME" ]] && export ANDROID_VIEW_CLIENT_HOME="$HOME/Downloads/AndroidViewClient-15.5.1"
# [[ -z "$PYTHONPATH" ]] && export PYTHONPATH="$HOME/Downloads/AndroidViewClient-15.5.1"
# [[ -z "$PYTHONHOME" ]] && export PYTHONHOME="$HOME/Downloads/AndroidViewClient-15.5.1"

alias black="black --verbose --line-length=100 --target-version=py38"
alias yapf="yapf --style='{ based_on_style: facebook, column_limit: 100, continuation_align_style: FIXED, continuation_indent_width: 4, indent_width: 4, spaces_before_comment: 1, use_tabs: true }'"
