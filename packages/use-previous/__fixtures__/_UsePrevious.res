let default = () => {
  let (value, setValue) = React.useState(() => 0)

  let previousValue = UsePrevious.usePrevious(value)

  React.useEffect0(() => {
    Js.Global.setInterval(() => {
      setValue(prev => prev + 1)
    }, 1000)->ignore
    None
  })

  <div className="p-0">
    <div> {"Previous Value: "->React.string} {previousValue->string_of_int->React.string} </div>
    <div> {"Value: "->React.string} {value->string_of_int->React.string} </div>
  </div>
}
