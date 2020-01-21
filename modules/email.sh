function hunterio-domain() {
	if [[ $(curl "https://api.hunter.io/v2/email-count?api_key=$__HUNTER_IO_API_KEY&domain=$1" | jq '.data.total') -gt 0 ]]; then
		curl "https://api.hunter.io/v2/domain-search?api_key=$__HUNTER_IO_API_KEY&limit=100&domain=$1" | json
	else
		echo "🌕 email-count == 0"
	fi
}

function mailboxlayer-check() {
	curl "https://apilayer.net/api/check?access_key=$__MAILBOX_LAYER_API_KEY&smtp=1&email=$1" | json
}
