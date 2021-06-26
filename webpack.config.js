const { createWebpackDevConfig } = require("@craco/craco");
const cracoConfig = require("./craco.config.js");
const config = createWebpackDevConfig(cracoConfig);

module.exports = config;
