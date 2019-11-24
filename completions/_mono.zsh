#compdef mono

# shellcheck disable=SC2148

# Zsh completion script for mono (http://www.mono-project.com/).

local curcontext=$curcontext state
local -a line
local -A opt_args

# For more information, see http://zsh.sourceforge.net/Doc/Release/Completion-System.html
# and search for "Each of the forms above may be preceded by a list in
# parentheses of option names and argument numbers".
_arguments -C \
  '(- :)'{--help,-h}'[Show help]' \
  '(- :)'--version'[Show version]' \
  '(--verbose -v)'{--verbose,-v}'[Increases the verbosity level]' \
  '(--config)'--config'[Loads FILE as the Mono config]:config file:_files' \
  '(--runtime)'--runtime=-'[Use the VERSION runtime, instead of autodetecting]:runtime: ' \
  '(--optimize)'--optimize=-'[Turns on or off a specific optimization]:optimization:->optimizations' \
  '(--security)'--security=-'[Turns on the unsupported security manager (off by default)]:security manager:(cas core-clr verifiable validil)' \
  '(--attach)'--attach=-'[Pass OPTIONS to the attach agent in the runtime]:options:(disable)' \
  '(--llvm --nollvm)'--llvm'[Enable the runtime to use LLVM to compile code]' \
  '(--nollvm --llvm)'--nollvm'[Disable the runtime to use LLVM to compile code]' \
  '(--gc)'--gc=-'[Select SGen or Boehm GC (runs mono or mono-sgen)]:garbage collector:(sgen boehm)' \
  '(--arch)'--arch=-'[Select architecture (runs mono32 or mono64)]:architecture:(32 64)' \
  '(-):program:_files -g "*.exe"' \
  '*:program option:_precommand' \
&& return 0

case "$state" in
  (optimizations)
    local -a opts args desc
    opts=(${(f)"$(_call_program list-opt mono --list-opt)"})

    local opt
    for opt in $opts; do
      args+="${${(s: :)opt}[1]}"
      desc+="${${(s: :)opt}[2,-1]}"
    done

    _wanted optimization expl optimization compadd -d desc -l -a - args
  ;;
esac
