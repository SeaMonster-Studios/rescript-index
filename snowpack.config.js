module.exports = {
  mount: {
    // directory name: 'build directory'
    public: '/',
    packages: '/dist',
  },
  plugins: ['@snowpack/plugin-react-refresh', '@snowpack/plugin-babel', '@snowpack/plugin-postcss'],
  routes: [
    // Cosmos renderer iframe URL
    /* Enable an SPA Fallback in development: */
    { "match": "routes", "src": "/_renderer.html", "dest": "/index.cosmos.html" },
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
    port: 3001
    /* ... */
  },
  buildOptions: {
    /* ... */
  },
  exclude: ["**/lib/**", "**/cosmos.userdeps.js"]
};