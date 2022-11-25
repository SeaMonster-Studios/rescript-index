type accordionType = [#single | #multiple]

/* Currently only supports type="single" */
@react.component @module("@radix-ui/react-accordion")
external make: (
  ~asChild: bool=?,
  ~\"type": accordionType=?,
  ~value: string=?,
  ~defaultValue: string=?,
  ~onValueChange: string => unit=?,
  ~collapsible: bool=?,
  ~disabled: bool=?,
  ~children: React.element,
  ~className: string=?,
) => React.element = "Root"

module Item = {
  @react.component @module("@radix-ui/react-accordion")
  external make: (
    ~asChild: bool=?,
    ~value: string,
    ~disabled: bool=?,
    ~children: React.element,
    ~className: string=?,
    ~id: string=?,
  ) => React.element = "Item"
}

module Header = {
  @react.component @module("@radix-ui/react-accordion")
  external make: (~asChild: bool=?, ~children: React.element) => React.element = "Header"
}

module Trigger = {
  @react.component @module("@radix-ui/react-accordion")
  external make: (
    ~asChild: bool=?,
    ~children: React.element,
    ~className: string=?,
  ) => React.element = "Trigger"
}

module Content = {
  @react.component @module("@radix-ui/react-accordion")
  external make: (
    ~asChild: bool=?,
    ~forceMount: bool=?,
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "Content"
}
