module.exports = {
  mount: {
    // directory name: 'build directory'
    public: '/',
    packages: '/dist',
  },
  plugins: ['@snowpack/plugin-react-refresh', '@snowpack/plugin-babel'],
  routes: [
    // Cosmos renderer iframe URL
    { src: '/_renderer.html', dest: '/index.cosmos.html' },
    /* Enable an SPA Fallback in development: */
    // {"match": "routes", "src": ".*", "dest": "/index.html"},
  ],
  optimize: {
    /* Example: Bundle your final build: */
    // "bundle": true,
  },
  packageOptions: {
    /* ... */
  },
  devOptions: {
    open: 'none',
    /* ... */
  },
  buildOptions: {
    /* ... */
  },
};