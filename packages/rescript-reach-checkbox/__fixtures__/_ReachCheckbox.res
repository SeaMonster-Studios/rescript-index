let default = () => {
  open ReachCheckbox

  let (checked, setChecked) = React.useState(() => #"\false")

  let inputRef = React.useRef(Js.Nullable.null)

  let (inputProps, stateData) = use(
    inputRef,
    {
      checked: checked->Some,
      onChange: setChecked->handleOnChange,
      disabled: false,
    },
  )

  <div className="p-4">
    <label>
      <ReactSpread props={inputProps}>
        <input ref={inputRef->ReactDOM.Ref.domRef} />
        {"This is a checkbox created with Reach Checkbox hook"->React.string}
      </ReactSpread>
    </label>
    <button onClick={_ => setChecked(_ => #mixed)}> {"Mix it up"->React.string} </button>
    <hr />
    {"Current state is:"->React.string}
    <pre> {stateData.checked->Obj.magic->React.string} </pre>
  </div>
}
