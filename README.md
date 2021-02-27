# SeaMonster Studios ReScript Index

A monorepo that contains bindings and reusable components across projects

## Monorepo practices

- __Using PPXs is Discouraged__. If a PPX needs to be used it should be self contained within a package that is not used by other packages in this repo. The reason for this is that each PPX requires internal knowledge on how a given version of ReScript works and can make the upgrade path for projects that depend on them very difficult.

- __Cut the Styles__. You should never include any style libraries or CSS-in-JS libraries in this repo. Design your components with a "headless" architecture in mind, setting them up as only hooks where possible. This will make them more reusable across projects anyway. It will also reduce the amount of dependencies required and prevent style overriding.

- __Code Reviews are Necessary__. Make sure your code is always reviewed by another engineer before publishing. This should happen through a formal PR process.

- __Be Kind to JS__. One goal of open-sourcing ReScript code at SeaMonster Studios is to help other developers to see ReScript in action and how it can provide a better DX and more usable/maintainable software. As such, be sure that each package you add (bindings aside), compiles to and can be utilized by JavaScript developers.

## Table of Contents

1. [Installation](#Installation)
2. [Build & Local Development](#Build)
3. [Publishing](#Publishing)
4. [Adding a new package](#Adding-a-new-package)
5. [Documenting your package](#Documenting-your-package)
6. [Adding dependencies to a package](#Adding-dependencies-to-a-package)
7. [Setting up the Package to be used within a JavaScript Project](#Setting-up-the-Package-to-be-used-within-a-JavaScript-Project)
8. [Using Packages in this Repo within a JavaScript Project](#Using-Packages-in-this-Repo-within-a-JavaScript-Project)

## Installation

```sh
npm i -g lerna && yarn
```

## Build

- Build: `yarn build`
- Clean: `yarn clean`
- Build & watch: `yarn dev`

## Publishing

1. Sign into npm in your terminal, npm login
2. Run lerna publish and make version bump selection.

## Adding a new package

1. Duplicate one of the existing component packages
2. Update the `name` field in __package.json__ and __bsconfig.json__ (they need to match). The package name should always be prepended with `@seamonster-studios/rescript-`
3. Update the `repository` field in package.json to point to the new package's directory within the repo
4. Develop your new package
5. Follow the steps in [the publishing updates section](#Publishing)

## Adding dependencies to a package

Within on of the ./packages, run `yarn add <pkgName>` like normal, then run `lerna bootstrap`

## Documenting your package

> WIP

## Setting up the Package to be used within a JavaScript Project

Within `package.json` make sure that the `main` property is pointing to your compiled root file. 

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
import { usePrevious, Counter } from "@seamonster-studios/rescript-use-previous"
```

3. Use the imported module
```javascript
let [state, setState] = React.useState(() => 0)
let prevState = usePrevious(state)

React.useEffect(() => {
  setInterval(() => {
    setState(s => s += 1)
  }, 2000)

}, [])
```

Keep in mind that because of how React components are compiled within ReScript you cannot use `Counter` (or any React component) directly as it's actually an object. Use components like so:

```javascript
<Counter.make>
  Learn React
</Counter.make>
```