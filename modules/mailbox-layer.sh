function email() {
	curl "https://apilayer.net/api/check?access_key=$__MAILBOX_LAYER_API_KEY&smtp=1&email=$1" | json
}
