[[ -z "$FLUTTER_ROOT" ]] && export FLUTTER_ROOT="/usr/local/var/flutter"
[[ -z "$DART_SDK" ]] && export DART_SDK="/usr/local/var/flutter/bin/cache/dart-sdk"

alias fl="flutter"
alias flcd="cd $FLUTTER_ROOT"
alias pub="flutter pub"
alias publs="lch $FLUTTER_ROOT/.pub-cache/bin"

# alias publs="flutter pub global list"
# alias pubin="flutter pub global activate"
# alias pubrm="flutter pub global deactivate"
