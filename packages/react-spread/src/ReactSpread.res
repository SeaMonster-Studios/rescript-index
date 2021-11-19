@react.component
let make = (~props, ~children) => {
  switch React.Children.count(children) == 1 {
  | true => React.cloneElement(children, props)
  | false =>
    Js.Console.error(
      "RESCRIPT INDEX:: ReactSpread must have exactly 1 child. This child must be a native HTML element, not a React component (Example: `<input />`, not `<Input />`)",
    )
    React.null
  }
}
