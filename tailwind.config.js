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
      addVariant("aria-selected", ({ modifySelectors, separator }) => {
        modifySelectors(({ className }) => {
          return `[aria-selected="true"].${e(
            `aria-selected::${separator}${className}`
          )}`;
        });
      });
    }),
    plugin(function ({ addVariant, e }) {
      addVariant("aria-expanded", ({ modifySelectors, separator }) => {
        modifySelectors(({ className }) => {
          return `[aria-expanded="true"].${e(
            `aria-expanded::${separator}${className}`
          )}`;
        });
      });
    }),
    plugin(function ({ addVariant, e }) {
      addVariant("aria-expanded::", ({ modifySelectors, separator }) => {
        modifySelectors(({ className }) => {
          return `[aria-expanded="true"] ~ .${e(
            `aria-expanded::${separator}${className}`
          )}`;
        });
      });
    }),
  ],
  variants: {
    extend: {
      opacity: ["aria-expanded::"],
      cursor: ["hover"],
      backgroundColor: ["aria-selected"],
      textColor: ["aria-selected"],
      borderRadius: ["first", "last"],
    },
  },
};
