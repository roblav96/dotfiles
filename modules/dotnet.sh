export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# _dotnet() {
# 	local completions=("$(dotnet complete "$words")")
# 	reply=( "${(ps:\n:)completions}" )
# }
# compctl -K _dotnet dotnet
