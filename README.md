# SeaMonster Studios ReScript Index

A monorepo that contains bindings and reusable components across projects

## Monorepo practices

- **Using PPXs are Discouraged**. If a PPX needs to be used it should be self contained within a package that is not used by other packages in this repo. The reason for this is that each PPX requires internal knowledge on how a given version of ReScript works and can make the upgrade path for projects that depend on them very difficult.

- **Cut the Styles**. You should never include any style libraries or CSS-in-JS libraries in this repo. Design your components with a "headless" architecture in mind, setting them up as only hooks where possible. This will make them more reusable across projects anyway. It will also reduce the amount of dependencies required and prevent style overriding.

- **Code Reviews are Necessary**. Make sure your code is always reviewed by another engineer before deploying. This should happen through a formal PR process.

- **Be Kind to JS**. One goal of open-sourcing ReScript code at SeaMonster Studios is to help other developers to see ReScript in action and how it can provide a better DX and more usable/maintainable software. As such, be sure that each package you add (bindings aside), compiles to and can be utilized by JavaScript developers.

## Table of Contents

1. [Installation](#Installation)
2. [Creating a new package](#Creating-a-new-package)
3. [Developing and Deploying Packages](#Developing-and-Deploying-Packages)
4. [Documenting your package](#Documenting-your-package)
5. [Adding dependencies to a package](#Adding-dependencies-to-a-package)
6. [Adding other ReScript Index packages to a package](Adding-other-ReScript-Index-packages-to-a-package)
7. [Setting up the Package to be used within a JavaScript Project](#Setting-up-the-Package-to-be-used-within-a-JavaScript-Project)
8. [Using Packages in this Repo within a JavaScript Project](#Using-Packages-in-this-Repo-within-a-JavaScript-Project)

## Installation

```sh
npm i -g lerna && yarn
```

## Creating a new package

Run the `make` script providing the name of the package in snake case.

Example:

```
yarn make use-previous
```

This will install dependencies and generate the following files with everything configured for deploying and usage within this monorepo:

- bsconfig.json
- package.json
- README.md
- [ROOT_FILE].res

## Developing and Deploying Packages

Run the following scripts within the directory of the package you are developing:

- Build & watch: `yarn dev`
- Clean: `yarn clean`
- Build: `yarn build`
- Deploying:

  1. Sign into npm in your terminal with `npm login`
  2. Run `yarn deploy` and make version bump selection.

## Adding dependencies to a package

Within on of the ./packages, run `yarn add <pkgName>` like normal, then run `lerna bootstrap`

## Adding other ReScript Index packages to a package

1. Make sure both packages are deployed

## Documenting your package

> WIP

## Setting up the Package to be used within a JavaScript Project

Within `package.json` make sure that the `main` property is pointing to your compiled root file. This is already done for you when you use the `make` script.

```json
"main": "src/UsePrevious.js",
```

In general packages in this repo should be minimal and so you wouldn't need to export things from more than the root file. However, if you find the need to do so you can simply create variables within your `.res` root file pointing to any other file. That variable would then get exported and be available within the compiled root `.js` file.

```rescript
// UsePrevious.res

let someFancyUtility = AFakeFile.someFancyThing
```

## Using Packages in this Repo within a JavaScript Project

1. Install the package

> yarn add @seamonster-studios/rescript-use-previous

2. Import the package in a `.js` file

```javascript
import {
  usePrevious,
  Counter,
} from "@seamonster-studios/rescript-use-previous";
```

3. Use the imported module

```javascript
let [state, setState] = React.useState(() => 0);
let prevState = usePrevious(state);

React.useEffect(() => {
  setInterval(() => {
    setState((s) => (s += 1));
  }, 2000);
}, []);
```

Keep in mind that because of how React components are compiled within ReScript you cannot use `Counter` (or any React component) directly as it's actually an object. Use components like so:

```javascript
<Counter.make>Learn React</Counter.make>
```
