# SvelteKit + Docker + NGINX with Local SSL + HMR

- Replace example.com anywhere in nginx folder for production
- Add private key/cert to nginx/dev (use mkcert)
	- mkcert -install -key-file local.key.pem -cert-file local.cert.pem localhost foo.local
	- Add key to system keychains in Keychain Access (on mac)
- Add .env from .env.example