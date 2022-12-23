<p align="center">
<img width="636" alt="SvelteKit Docker NGINX" src="https://user-images.githubusercontent.com/5855825/209408200-95972e4c-39f0-4f61-8538-36236a603ba3.png">
</p>

<div align="center">
  <h1>SvelteKit-Docker-NGINX</h1>
</div>
<p align="center">
This template allows you to have NGINX proxy requests to your SvelteKit app,<br>while keeping Hot Module Replacement (HMR) and SSL functional with your development environment.
</p>

## Features
**setup-server.sh**
- Installs Docker/Compose dependencies and enables HTTP/HTTPS traffic

**setup-ssl.sh**
- This script allows production NGINX to start by creating the requisite dummy Certbot certificate, starting NGINX and finally replacing the dummy certificate with a live certificate. This prevents us from having to modify NGINX's production default.conf when deploying.

**USE_POLLING/CHOKIDAR_USEPOLLING**
- `true` - Windows development environment (fixes an issue with endless HMR reloads)
- `false` - Mac/Linux development environment


## Usage
**Development**
- Create a private key and certificate using `mkcert`
    -   ```
        mkcert -install -key-file local.key.pem -cert-file local.cert.pem localhost foo.local
        ```
    - `nginx/dev/local.cert.pem` & `nginx/dev/local.key.pem` need to be created
    - On Mac OS, add key to system keychains in Keychain Access

**Production**
- Replace `example.com` with your domain name in:
    - `nginx/prod/default.conf`
    - `setup-ssl.sh`
- Replace `example@example.com` with your email address in `setup-ssl.sh`
- `chmod +x setup-server.sh setup-ssl.sh`
- `sudo ./setup-server.sh`
- `sudo ./setup-ssl.sh`
- `docker compose up --build --force-recreate -d`
