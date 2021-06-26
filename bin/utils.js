function log(message) {
  console.log("\x1b[36m%s\x1b[0m", `\nRESCRIPT INDEX::${message}\n`);
}

module.exports = {
  log,
};
