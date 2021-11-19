let id = "my-checkbox"

module CheckField = {
  @react.component
  let make = (~checked, ~handleChange, ~optionLabel, ~label) => {
    open ReachCheckbox

    let inputRef = React.useRef(Js.Nullable.null)

    let (inputProps, _stateData) = use(
      inputRef,
      {
        // need to use default checked here b/c this is a controlled component and we're updating the value w/in this onChange
        checked: None,
        defaultChecked: checked->Some,
        onChange: _ => checked->toggleChecked->handleChange,
        disabled: false,
      },
    )

    <div className="p-4">
      <label className="block" htmlFor={id}> {label->React.string} </label>
      <div className="flex my-4 items-center justify-start text-left">
        <div className="flex items-center ">
          <button
            type_="button"
            className={`flex w-4 h-4 border-2 border-black transition-colors duration-300 rounded-sm ${checked ==
                #"true"
                ? "bg-black"
                : "bg-transparent"}`}
            onClick={inputProps.onChange}
          />
          <ReactSpread props={inputProps}>
            <input ref={inputRef->ReactDOM.Ref.domRef} className="invisible w-0 h-0" />
          </ReactSpread>
        </div>
        <button type_="button" className="flex ml-2" onClick={inputProps.onChange}>
          {optionLabel->React.string}
        </button>
      </div>
      {"Current state is: "->React.string}
      {checked->Obj.magic->React.string}
    </div>
  }
}

let default = () => {
  let (checked, setChecked) = React.useState(() => #"false")

  <CheckField
    checked
    optionLabel="Mix it up"
    label="This is a checkbox created with Reach Checkbox hook"
    handleChange={checked => setChecked(_ => checked)}
  />
}
