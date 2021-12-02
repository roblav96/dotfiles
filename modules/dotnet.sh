[[ -z "$DOTNET_CLI_TELEMETRY_OPTOUT" ]] && export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# which dn &>/dev/null || alias dn="dotnet"
# which mo &>/dev/null || alias mo="mono"

alias cake="dotnet cake"
alias msbuild="dotnet msbuild"
alias nuget="dotnet nuget"

# _dotnet() {
# 	local completions=("$(dotnet complete "$words")")
# 	reply=( "${(ps:\n:)completions}" )
# }
# compctl -K _dotnet dotnet
