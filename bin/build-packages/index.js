const fs = require("fs-extra");
const changeCase = require("change-case");
const { exec } = require("child_process");
const { log } = require("../utils");

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
            console.error(err);
          } else {
            console.log(stdout);
            console.log(stderr);
            log(`Finished building ${pkg}`);
          }
        }
      );
    });
  } catch (_) {
    log("`packages` directory not found!");
  }
}
