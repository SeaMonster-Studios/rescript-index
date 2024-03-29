const fs = require("fs-extra");
const { exec } = require("child_process");
const { log, logGreen, logRed } = require("../utils");
const changeCase = require("change-case");

const args = process.argv.slice(2);
const isBindings = args.some((i) => i === "-b");
const isReact = args.some((i) => i === "-r");

if (args.length > 0) {
  make();
} else {
  log(
    "You must provide the name of the package. Example:\n\n\tyarn make use-previous"
  );
}

async function replaceTokens(dir, pkgName, pkgFileName, files) {
  let rePkg = new RegExp("PKG_NAME", "g");
  let reRoot = new RegExp("FILE_NAME", "g");
  let reReadmeTitle = new RegExp("README_TITLE", "g");

  await Promise.all(
    files.map(async (fileName) => {
      let file = (await fs.readFile(`${dir}/${fileName}`, "utf8"))
        .replace(rePkg, pkgName)
        .replace(reRoot, pkgFileName)
        .replace(
          reReadmeTitle,
          isBindings ? `${pkgFileName} ReScript Bindings` : pkgFileName
        );

      let bsConfig;

      if (isReact && fileName === "bsconfig.json") {
        bsConfig = JSON.parse(file);
        bsConfig = {
          ...bsConfig,
          "bs-dependencies": [
            ...bsConfig["bs-dependencies"],
            "@rescript/react",
          ],
        };

        file = JSON.stringify(bsConfig);
      }

      try {
        await fs.writeFile(`${dir}/${fileName}`, file);
      } catch (error) {
        console.log(error);
      }
    })
  );
}

async function make() {
  let name = args.find((i) => !i.startsWith("-"));
  let pkgName = changeCase.paramCase(name);
  let fileName = changeCase.pascalCase(name.replace(/\s/g, ""));

  if (isBindings) {
    pkgName = pkgName.includes("rescript-") ? pkgName : `rescript-${pkgName}`;
    fileName = fileName.replace("rescript-", "");
  }

  let newDir = `${__dirname}/../../packages/${pkgName}`;

  try {
    await fs.readdir(newDir);
    console.log("here");
    logRed(
      `A \`${pkgName}\` package already exits. Please select a different name.`
    );
  } catch (_) {
    try {
      await fs.copy(`${__dirname}/package-template`, newDir);

      let files = await fs.readdir(newDir);

      await replaceTokens(newDir, pkgName, fileName, files);

      fs.mkdir(`${newDir}/src`, async function (err) {
        if (err) {
          return console.log(error);
        }

        fs.mkdir(`${newDir}/__fixtures__`, async function (err) {
          if (err) {
            return console.log(error);
          }

          await fs.writeFile(`${newDir}/src/${fileName}.res`, "");

          await fs.openSync(`${newDir}/__fixtures__/.gitkeep`, "w");

          if (!isBindings && isReact) {
            await fs.writeFile(
              `${newDir}/__fixtures__/_${fileName}.res`,
              `
let default = () => {
  React.null
}
      `
            );
          }

          process.chdir(newDir);

          log("Installing dependencies...");

          let initCmd = isReact
            ? `yarn && yarn add @rescript/react && yarn add -P react react-dom && yarn build`
            : `yarn && yarn build`;

          exec(initCmd, (err, stdout, stderr) => {
            if (err) {
              logRed(`Failed to create \`${pkgName}\` package...`);
              console.error(err);
            } else {
              console.log(stdout);
              console.log(stderr);
              logGreen(`Successfully created \`${pkgName}\` package`);
            }
          });
        });
      });
    } catch (error) {
      console.log("error", error);
      logRed(
        `A \`${pkgName}\` package already exits. Please select a different name.`
      );
    }
  }
}
