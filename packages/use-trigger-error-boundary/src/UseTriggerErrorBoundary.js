// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";
import * as React from "react";

function use(param) {
  var match = React.useState(function () {
        return false;
      });
  var error = match[0];
  return React.useCallback((function (param) {
                var makeError = (function () {
        // eslint-disable-next-line
        error.nothingHere()
      });
                Curry._1(makeError, error);
              }), [
              error,
              match[1]
            ]);
}

export {
  use ,
}
/* react Not a pure module */
