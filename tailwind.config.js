module.exports = {
  purge: [
    "./src/**/*.{js,jsx,ts,tsx,css,res}",
    "./packages/**/*.{js,jsx,ts,tsx,css,res}",
    "./public/index.html",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
