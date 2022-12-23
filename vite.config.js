import { sveltekit } from '@sveltejs/kit/vite';
import fs from 'fs';

let httpsConfig = process.env.NODE_ENV === "development" ? {
	key: fs.readFileSync('./nginx/dev/local.key.pem'),
	cert: fs.readFileSync('./nginx/dev/local.cert.pem')
} : false;

/** @type {import('vite').UserConfig} */
const config = {
	plugins: [sveltekit()],
	test: {
		include: ['src/**/*.{test,spec}.{js,ts}']
	},
	server: {
		strictPort: true,
		watch: {
			usePolling: process.env.USE_POLLING,
		},
		hmr: {
			clientPort: 5050
		},
		host: '0.0.0.0',
		port: 5050,
		https: httpsConfig
	}
};

export default config;
