# lego -s https://acme-staging-v02.api.letsencrypt.org/directory
lego -d futon.media -a -m roblav96@gmx.com --http.webroot /var/www --path /root/.lego --http renew
