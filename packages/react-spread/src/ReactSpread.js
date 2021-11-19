// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function ReactSpread(Props) {
  var props = Props.props;
  var children = Props.children;
  console.log(React.Children.count(children));
  if (React.Children.count(children) === 1) {
    return React.cloneElement(children, props);
  } else {
    console.error("RESCRIPT INDEX:: ReactSpread must have exactly 1 child. This child must be a native HTML element, not a React component (Example: `<input />`, not `<Input />`)");
    return null;
  }
}

var make = ReactSpread;

export {
  make ,
  
}
/* react Not a pure module */
