#compdef lsd

autoload -U is-at-least

_lsd() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'*--color=[When to use terminal colours]: :(always auto never)' \
'*--icon=[When to print the icons]: :(always auto never)' \
'*--icon-theme=[Whether to use fancy or unicode icons]: :(fancy unicode)' \
'--depth=[Stop recursing into directories after reaching specified depth]' \
'*--size=[How to display size]: :(default short bytes)' \
'*--date=[How to display date]: :(date relative)' \
'*--group-dirs=[Sort the directories then the files]: :(none first last)' \
'*--blocks=[Specify the blocks that will be displayed and in what order]: :(permission user group size date name)' \
'*-a[Do not ignore entries starting with .]' \
'*--all[Do not ignore entries starting with .]' \
'*-A[Do not list implied . and ..]' \
'*--almost-all[Do not list implied . and ..]' \
'*-F[Append indicator (one of */=>@|) at the end of the file names]' \
'*--classify[Append indicator (one of */=>@|) at the end of the file names]' \
'*-l[Display extended file metadata as a table]' \
'*--long[Display extended file metadata as a table]' \
'*-1[Display one entry per line]' \
'*--oneline[Display one entry per line]' \
'(--tree)*-R[Recurse into directories]' \
'(--tree)*--recursive[Recurse into directories]' \
'-h[For ls compatibility purposes ONLY, currently set by default]' \
'--human-readable[For ls compatibility purposes ONLY, currently set by default]' \
'(-R --recursive)*--tree[Recurse into directories and present the result as a tree]' \
'(-a --all -A --almost-all --depth -R --recursive --tree)-d[Display directories themselves, and not their contents]' \
'(-a --all -A --almost-all --depth -R --recursive --tree)--directory-only[Display directories themselves, and not their contents]' \
'*--total-size[Display the total size of directories]' \
'*-t[Sort by time modified]' \
'*--timesort[Sort by time modified]' \
'*-S[Sort by size]' \
'*--sizesort[Sort by size]' \
'*-r[Reverse the order of the sort]' \
'*--reverse[Reverse the order of the sort]' \
'--classic[Enable classic mode (no colors or icons)]' \
'*--no-symlink[Do not display symlink target]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'::FILE:_files' \
&& ret=0

}

(( $+functions[_lsd_commands] )) ||
_lsd_commands() {
    local commands; commands=(

    )
    _describe -t commands 'lsd commands' commands "$@"
}

_lsd "$@"
