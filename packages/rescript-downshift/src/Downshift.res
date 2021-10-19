module Select = Downshift_Select

module Spread = {
  @react.component
  let make = (~props, ~children) => React.cloneElement(children, props)
}
