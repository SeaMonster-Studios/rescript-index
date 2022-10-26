module Root = {
  @react.component @module("@radix-ui/react-checkbox")
  external make: (
    ~id: string=?,
    ~asChild: bool=?,
    ~defaultChecked: bool=?,
    ~checked: bool=?,
    ~onCheckedChange: bool => unit=?,
    ~disabled: bool=?,
    ~required: bool=?,
    ~name: string=?,
    ~value: string=?,
    ~children: React.element=?,
    ~className: string=?,
    ~style: ReactDOM.Style.t=?,
  ) => React.element = "Root"
}

module Indicator = {
  @react.component @module("@radix-ui/react-checkbox")
  external make: (
    ~asChild: bool=?,
    ~forceMount: bool=?,
    ~children: React.element=?,
    ~className: string=?,
    ~style: ReactDOM.Style.t=?,
  ) => React.element = "Indicator"
}
