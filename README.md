# SvelteKit + Docker + NGINX with Local SSL + HMR

- Add .env from .env.example

## For Development:
- Add private key/cert to nginx/dev (use mkcert)
	- nginx/dev/local.cert.pem & nginx/dev/local.key.pem
	- mkcert -install -key-file local.key.pem -cert-file local.cert.pem localhost foo.local
	- Add key to system keychains in Keychain Access (on mac)

## For Production:
- Replace domain in nginx/prod/default.conf
- Replace domain & email in setup-ssl.sh
- chmod +x setup-server.sh setup-ssl.sh
- sudo ./setup-server.sh (Installs Docker and Docker Compose, allows 80/443 TCP)
- sudo ./setup-ssl.sh (Handles creating dummy certs, launching nginx, deleting dummy certs and installing real certs)
- docker compose up --build --force-recreate -d