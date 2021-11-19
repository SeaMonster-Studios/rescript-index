type checkedT = [#mixed | #"\true" | #"\false"]

let toCheckedT: string => checkedT = checked => checked->Obj.magic

let handleOnChange = (setState, e: ReactEvent.Mouse.t) => {
  let target = e->ReactEvent.Mouse.target
  setState(_ => target["checked"]->toCheckedT)
}

type props = {
  checked: option<checkedT>,
  onChange: ReactEvent.Mouse.t => unit,
  disabled: bool,
}

type inputProps = {
  @as("aria-checked")
  ariaChecked: checkedT,
  checked: bool,
  disabled: bool,
  onChange: ReactEvent.Mouse.t => unit,
  onClick: ReactEvent.Mouse.t => unit,
  @as("type")
  type_: string,
}

type state = {checked: checkedT}

@module("@reach/checkbox")
external use: (React.ref<'t>, props) => (inputProps, state) = "useMixedCheckbox"

module Mixed = {
  type props = {
    "className": option<string>,
    "style": option<ReactDOM.Style.t>,
    "value": option<string>,
    "checked": string,
    "onChange": option<ReactEvent.Form.t => unit>,
  }

  @module("@reach/checkbox")
  external make: React.component<props> = "MixedCheckbox"

  let makeProps = (
    ~className: option<string>=?,
    ~style: option<ReactDOM.Style.t>=?,
    ~value: option<string>=?,
    ~checked: checkedT,
    ~onChange: option<ReactEvent.Form.t => unit>=?,
    (),
  ) =>
    {
      "className": className,
      "style": style,
      "value": value,
      "onChange": onChange,
      "checked": checked,
    }
}
module Custom = {
  type props = {
    "className": option<string>,
    "style": option<ReactDOM.Style.t>,
    "value": option<string>,
    "checked": string,
    "name": option<string>,
    "disabled": option<bool>,
    "defaultChecked": option<bool>,
    "children": option<React.element>,
    "onChange": option<ReactEvent.Form.t => unit>,
  }

  @module("@reach/checkbox")
  external make: React.component<props> = "CustomCheckbox"

  let makeProps = (
    ~className: option<string>=?,
    ~style: option<ReactDOM.Style.t>=?,
    ~value: option<string>=?,
    ~checked: checkedT,
    ~defaultChecked: option<bool>=?,
    ~name: option<string>=?,
    ~disabled: option<bool>=?,
    ~children: option<React.element>=?,
    ~onChange: option<ReactEvent.Form.t => unit>=?,
    (),
  ) =>
    {
      "className": className,
      "style": style,
      "value": value,
      "name": name,
      "disabled": disabled,
      "defaultChecked": defaultChecked,
      "children": children,
      "onChange": onChange,
      "checked": checked,
    }
}
