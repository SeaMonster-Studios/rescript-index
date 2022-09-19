module Root = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (
    ~children: React.element,
    ~onOpenChange: bool => unit=?,
    ~\"open": bool,
    ~modal: bool=?,
    ~defaultOpen: bool=?,
    ~id: string=?,
  ) => React.element = "Root"
}

module Trigger = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (~asChild: bool=?, ~\"data-state": string=?) => React.element = "Trigger"
}

module Portal = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (~forceMount: bool=?) => React.element = "Portal"
}

module Overlay = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (~asChild: bool=?, ~forceMount: bool=?, ~\"data-state": string) => React.element =
    "Overlay"
}

module Content = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (
    ~asChild: bool=?,
    ~forceMount: bool=?,
    ~children: React.element,
  ) => React.element = "Content"
}

module Close = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (~asChild: bool=?) => React.element = "Close"
}

module Title = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (~asChild: bool=?) => React.element = "Title"
}

module Description = {
  @react.component @module("@radix-ui/react-dialog")
  external make: (~asChild: bool=?) => React.element = "Description"
}
