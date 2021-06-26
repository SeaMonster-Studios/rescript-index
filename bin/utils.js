// Color codes: https://stackoverflow.com/questions/9781218/how-to-change-node-jss-console-font-color

function log(message) {
  console.log("\x1b[36m%s\x1b[0m", `\nRESCRIPT INDEX::${message}\n`);
}

function logGreen(message) {
  console.log("\x1b[32m%s\x1b[0m", `\nRESCRIPT INDEX::${message}\n`);
}

function logRed(message) {
  console.log("\x1b[31m%s\x1b[0m", `\nRESCRIPT INDEX::${message}\n`);
}

module.exports = {
  log,
  logGreen,
  logRed,
};
