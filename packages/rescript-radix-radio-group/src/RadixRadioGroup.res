module RadioGroup = {
  type orientation = [#horizontal | #vertical]
  type dir = [#ltr | #rtl]
  @react.component @module("@radix-ui/react-radio-group")
  external make: (
    ~asChild: bool=?,
    ~defaultValue: string=?,
    ~value: string=?,
    ~onValueChange: string => unit=?,
    ~name: string=?,
    ~required: bool=?,
    ~orientation: orientation=?,
    ~dir: dir=?,
    ~loop: bool=?,
    ~children: React.element,
    ~id: string=?,
    ~className: string=?,
    ~\"aria-label": string=?,
  ) => React.element = "Root"
}

module RadioGroupItem = {
  @react.component @module("@radix-ui/react-radio-group")
  external make: (
    ~asChild: bool=?,
    ~value: string=?,
    ~disabled: bool=?,
    ~required: bool=?,
    ~id: string=?,
    ~className: string=?,
    ~children: React.element=?,
  ) => React.element = "Item"
}

module RadioGroupIndicator = {
  @react.component @module("@radix-ui/react-radio-group")
  external make: (
    ~asChild: bool=?,
    ~forceMount: bool=?,
    ~id: string=?,
    ~className: string=?,
  ) => React.element = "Indicator"
}
