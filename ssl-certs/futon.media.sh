#!/bin/sh

/usr/bin/lego --path /etc/lego --accept-tos --email roblav96@gmx.com --domains futon.media --http --http.webroot /var/www renew
/usr/bin/lego --path /etc/lego --accept-tos --email roblav96@gmx.com --domains emby.futon.media --http --http.webroot /var/www renew

# lego -d futon.media -a -m roblav96@gmx.com --http.webroot /var/www --path /root/.lego --http renew
# lego -s https://acme-staging-v02.api.letsencrypt.org/directory

# openssl pkcs12 -export -inkey /root/.lego/certificates/futon.media.key -in /root/.lego/certificates/futon.media.crt -certfile /root/.lego/certificates/futon.media.issuer.crt -out /opt/emby-server/etc/ssl/certs/futon.media.pfx -passout pass:
# chmod 644 /opt/emby-server/etc/ssl/certs/futon.media.pfx
