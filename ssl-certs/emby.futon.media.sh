# lego -s https://acme-staging-v02.api.letsencrypt.org/directory
lego -d emby.futon.media -a -m roblav96@gmx.com --http.webroot /var/www --path /root/.lego --http renew

# openssl pkcs12 -export -inkey /root/.lego/certificates/emby.futon.media.key -in /root/.lego/certificates/emby.futon.media.crt -certfile /root/.lego/certificates/emby.futon.media.issuer.crt -out /opt/emby-server/etc/ssl/certs/emby.futon.media.pfx -passout pass:
# chmod 644 /opt/emby-server/etc/ssl/certs/emby.futon.media.pfx
