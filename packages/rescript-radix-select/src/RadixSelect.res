module Trigger = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?, ~className: string=?) => React.element = "Trigger"
}

module Value = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "Value"
}

module Icon = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "Icon"
}

module Portal = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "Portal"
}

module Content = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?, ~className: string=?) => React.element = "Content"
}

module Viewport = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "Viewport"
}

module Group = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "Group"
}

module Item = {
  @react.component @module("@radix-ui/react-select")
  external make: (
    ~children: React.element=?,
    ~className: string=?,
    ~value: string=?,
  ) => React.element = "Item"
}

module ItemText = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "ItemText"
}

module ItemIndicator = {
  @react.component @module("@radix-ui/react-select")
  external make: (~children: React.element=?) => React.element = "ItemIndicator"
}

@react.component @module("@radix-ui/react-select")
external make: (
  ~children: React.element=?,
  ~\"open": bool=?,
  ~value: string=?,
  ~onValueChange: string => unit=?,
) => React.element = "Root"
