// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";
import * as React from "react";
import * as ReactCheckbox from "@radix-ui/react-checkbox";

function $$default(param) {
  var match = React.useState(function () {
        return false;
      });
  var setChecked = match[1];
  return React.createElement("div", undefined, React.createElement(ReactCheckbox.Root, {
                  id: "the-checkbox",
                  checked: match[0],
                  onCheckedChange: (function (checked) {
                      Curry._1(setChecked, (function (param) {
                              return checked;
                            }));
                    }),
                  children: React.createElement("span", {
                        className: "flex w-4 h-4 border border-solid border-black"
                      }, React.createElement(ReactCheckbox.Indicator, {
                            className: "inline-block w-full h-full bg-black"
                          }))
                }), React.createElement("label", {
                  htmlFor: "the-checkbox"
                }, "Click me"));
}

export {
  $$default ,
  $$default as default,
}
/* react Not a pure module */
