# /opt/homebrew/opt/python@3.9/bin
# /opt/homebrew/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin
# /opt/homebrew/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/bin
# /opt/homebrew/opt/python@3.7/Frameworks/Python.framework/Versions/3.7/bin

# [[ -z "$PATH" ]] && export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
# [[ -z "$MYPYPATH" ]] && export MYPYPATH="/Applications/Sublime Text.app/Contents/MacOS"
# [[ -z "$PYTHONPATH" ]] && export PYTHONPATH="/opt/homebrew/lib/python3.7:/opt/homebrew/lib/python3.7/site-packages"
# [[ -z "$PATH" ]] && export PATH="/opt/homebrew/opt/python@2/bin:$PATH"
# [[ -z "$PYTHONPATH" ]] && export PYTHONPATH="/opt/homebrew/lib/python2.7:/opt/homebrew/lib/python2.7/site-packages"
# [[ -z "$ANDROID_VIEW_CLIENT_HOME" ]] && export ANDROID_VIEW_CLIENT_HOME="$HOME/Downloads/AndroidViewClient-15.5.1"
# [[ -z "$PYTHONPATH" ]] && export PYTHONPATH="$HOME/Downloads/AndroidViewClient-15.5.1"
# [[ -z "$PYTHONHOME" ]] && export PYTHONHOME="$HOME/Downloads/AndroidViewClient-15.5.1"

which black &>/dev/null && alias black='black --config $HOME/.pyproject.toml'
# alias black="black --line-length=100 --target-version=py38 --include='\.py$'"
alias yapf="yapf --style='{ based_on_style: facebook, column_limit: 100, continuation_align_style: FIXED, continuation_indent_width: 4, indent_width: 4, spaces_before_comment: 1, use_tabs: true }'"

# alias pip='pip --target=$HOME/.virtualenv'
# alias pip="python3 -m pip"
which python &>/dev/null || alias python="python3"
which pip &>/dev/null || alias pip="pip3"
alias pips="pip search"
alias pipi="pip show"
alias pipfs="pip show --files"
alias pipin="pip install --force-reinstall --break-system-packages"
alias piprm="pip uninstall --yes --break-system-packages"
alias pipls="pip list --verbose | bl fstab"
alias pipout="pip list --outdated | bl fstab"
alias pipupg="pip install --upgrade"
alias pipup="pip list --outdated --format=freeze | cut -d'=' -f1 | xargs -n1 pip install --upgrade"
