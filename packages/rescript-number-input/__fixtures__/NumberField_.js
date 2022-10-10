// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as ReactAria from "react-aria";
import * as ReactSpread from "@seamonster-studios/react-spread/src/ReactSpread.js";
import * as ReactStately from "react-stately";

var formatOptions = {
  style: "currency",
  currency: "USD"
};

var label = "Price";

function $$default(param) {
  var localeProps = ReactAria.useLocale();
  var state = ReactStately.useNumberFieldState({
        formatOptions: formatOptions,
        minValue: 10,
        defaultValue: 0,
        locale: localeProps.locale
      });
  var inputRef = React.useRef(null);
  var decrementButtonRef = React.useRef(null);
  var incrementButtonRef = React.useRef(null);
  var numberField = ReactAria.useNumberField({
        label: label
      }, state, inputRef);
  var decrementButton = ReactAria.useButton(numberField.decrementButtonProps, decrementButtonRef);
  var incrementButton = ReactAria.useButton(numberField.incrementButtonProps, incrementButtonRef);
  return React.createElement("div", undefined, React.createElement(ReactSpread.make, {
                  props: numberField.labelProps,
                  children: React.createElement("label", undefined, label)
                }), React.createElement(ReactSpread.make, {
                  props: numberField.groupProps,
                  children: React.createElement("div", {
                        className: "space-x-2"
                      }, React.createElement(ReactSpread.make, {
                            props: numberField.inputProps,
                            children: React.createElement("input", {
                                  ref: inputRef,
                                  className: "border"
                                })
                          }), React.createElement(ReactSpread.make, {
                            props: decrementButton.buttonProps,
                            children: React.createElement("button", undefined, "-")
                          }), React.createElement(ReactSpread.make, {
                            props: incrementButton.buttonProps,
                            children: React.createElement("button", undefined, "+")
                          }))
                }));
}

export {
  formatOptions ,
  label ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
