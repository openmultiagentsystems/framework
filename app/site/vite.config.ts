import path from 'node:path'
import vue from '@vitejs/plugin-vue'
import autoprefixer from 'autoprefixer'
import tailwind from 'tailwindcss'
import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    proxy: {
     // Target is your backend API
       '/api': {
           target: 'http://localhost:8000',
           rewrite: (path) => path.replace(/^\/api/, ''),
           
           configure: (proxy, options) => {
              proxy.on('error', (err, _req, _res) => {
               console.log('error', err);
              });
              proxy.on('proxyReq', (proxyReq, req, _res) => {
               console.log('Request sent to target:', req.method, req.url);
              });
              proxy.on('proxyRes', (proxyRes, req, _res) => {
               console.log('Response received from target:', proxyRes.statusCode, req.url);
              });
        },
     },
    },
  },
  css: {
    postcss: {
      plugins: [tailwind(), autoprefixer()],
    },
  },
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
