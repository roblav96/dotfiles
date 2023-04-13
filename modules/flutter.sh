# [[ -z "$FLUTTER_ROOT" ]] && export FLUTTER_ROOT="/opt/homebrew/share/flutter"
# [[ -z "$DART_SDK" ]] && export DART_SDK="/opt/homebrew/share/flutter/bin/cache/dart-sdk"

# alias fl="flutter"
alias flcd="cd $FLUTTER_ROOT"

alias pub="flutter pub"
alias pubin="flutter pub global activate"
alias publs="flutter pub global list"
alias publs="lch $FLUTTER_ROOT/.pub-cache/bin"
alias pubrm="flutter pub global deactivate"
alias pubget='flutter pub get'
