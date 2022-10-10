let formatOptions = {
  "style": "currency",
  "currency": "USD",
}

let label = "Price"

let default = () => {
  let localeProps = NumberField.useLocale()

  let state = NumberField.useNumberFieldState({
    "formatOptions": formatOptions,
    "minValue": 10,
    "defaultValue": 0,
    "locale": localeProps["locale"],
  })

  let inputRef = React.useRef(Js.Nullable.null)
  let decrementButtonRef = React.useRef(Js.Nullable.null)
  let incrementButtonRef = React.useRef(Js.Nullable.null)

  let numberField = NumberField.useNumberField({"label": label}, state, inputRef)

  let decrementButton = NumberField.useButton(
    numberField["decrementButtonProps"],
    decrementButtonRef,
  )
  let incrementButton = NumberField.useButton(
    numberField["incrementButtonProps"],
    incrementButtonRef,
  )

  <div>
    <ReactSpread props={numberField["labelProps"]}>
      <label> {label->React.string} </label>
    </ReactSpread>
    <ReactSpread props={numberField["groupProps"]}>
      <div className="space-x-2">
        <ReactSpread props={numberField["inputProps"]}>
          <input className="border" ref={ReactDOM.Ref.domRef(inputRef)} />
        </ReactSpread>
        <ReactSpread props={decrementButton["buttonProps"]}>
          <button> {"-"->React.string} </button>
        </ReactSpread>
        <ReactSpread props={incrementButton["buttonProps"]}>
          <button> {"+"->React.string} </button>
        </ReactSpread>
      </div>
    </ReactSpread>
  </div>
}
