
alias .ollama-upg="ollama list | tail -n+2 | awk '{ print \$1 }' | while read i; do (echo && echo \"🟡 '\$i'\" && ollama pull \$i); done"
