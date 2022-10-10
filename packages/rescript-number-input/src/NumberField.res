@module("react-stately")
external useNumberFieldState: {..} => {..} = "useNumberFieldState"

type elementRef = React.ref<Js.Nullable.t<Dom.element>>

@module("react-aria")
external useNumberField: ({..}, {..}, elementRef) => {..} = "useNumberField"


@module("react-aria")
external useLocale: unit => {..} = "useLocale"

@module("react-aria")
external useButton: ({..}, elementRef) => {..} = "useButton"
