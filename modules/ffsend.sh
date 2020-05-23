# local FFSEND_HISTORY="/dev/null"
# local FFSEND_INCOGNITO="1"
# local FFSEND_VERBOSE="1"
# local FFSEND_API="3"

alias ffsend="ffsend --incognito --verbose --api 3 --history /dev/null"
alias fsend="ffsend --incognito --verbose --api 3 --history /dev/null upload --gen-passphrase --download-limit 1 --expiry-time 1hr"
