# lego -s https://acme-staging-v02.api.letsencrypt.org/directory
lego -d futon.media -a -m roblav96@gmx.com --http.webroot /var/www --path /root/.lego --http renew

openssl pkcs12 -export \
	-inkey /root/.lego/certificates/futon.media.key \
	-in /root/.lego/certificates/futon.media.crt \
	-certfile /root/.lego/certificates/futon.media.issuer.crt \
	-out /opt/emby-server/etc/ssl/certs/futon.media.pfx
	# -passout pass:________
