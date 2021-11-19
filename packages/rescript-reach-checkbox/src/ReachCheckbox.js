// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";

function toCheckedT(checked) {
  return checked;
}

function handleOnChange(setState, e) {
  var target = e.target;
  return Curry._1(setState, (function (param) {
                return target.checked;
              }));
}

function makeProps(className, style, value, checked, onChange, param) {
  return {
          className: className,
          style: style,
          value: value,
          onChange: onChange,
          checked: checked
        };
}

var Mixed = {
  makeProps: makeProps
};

function makeProps$1(className, style, value, checked, defaultChecked, name, disabled, children, onChange, param) {
  return {
          className: className,
          style: style,
          value: value,
          name: name,
          disabled: disabled,
          defaultChecked: defaultChecked,
          children: children,
          onChange: onChange,
          checked: checked
        };
}

var Custom = {
  makeProps: makeProps$1
};

export {
  toCheckedT ,
  handleOnChange ,
  Mixed ,
  Custom ,
  
}
/* No side effect */