const fs = require("fs-extra");
const { exec } = require("child_process");
const { log, logGreen, logRed } = require("../utils");

build();

async function build() {
  let dir = `${__dirname}/../../packages`;

  try {
    let packages = await fs.readdir(dir);
    packages.map((pkg) => {
      log(`Started building ${pkg}`);
      exec(
        `cd ${__dirname}/../../packages/${pkg} && yarn && yarn build`,
        (err, stdout, stderr) => {
          if (err) {
            logRed(`Finished building ${pkg} with errors...`);
            console.error(err);
          } else {
            console.log(stdout);
            console.log(stderr);
            logGreen(`Successfully finished building ${pkg}`);
          }
        }
      );
    });
  } catch (_) {
    log("`packages` directory not found!");
  }
}
