[[ -z "$DOTNET_CLI_TELEMETRY_OPTOUT" ]] && export DOTNET_CLI_TELEMETRY_OPTOUT="1"

alias nuget="dotnet nuget"

# _dotnet() {
# 	local completions=("$(dotnet complete "$words")")
# 	reply=( "${(ps:\n:)completions}" )
# }
# compctl -K _dotnet dotnet
