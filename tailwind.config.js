const plugin = require("tailwindcss/plugin");

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
  plugins: [
    plugin(function ({ addVariant, e }) {
      addVariant("expanded::", ({ modifySelectors, separator }) => {
        modifySelectors(({ className }) => {
          return `[aria-expanded="true"] ~ .${e(
            `expanded::${separator}${className}`
          )}`;
        });
      });
    }),
  ],
  variants: {
    extend: {
      padding: ["expanded::"],
    },
  },
};
