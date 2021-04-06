let usePrevious = (value: 'a) => {
  let reference = React.useRef(value)
  React.useEffect1(() => {
    reference.current = value
    Some(() => ())
  }, [value])
  reference.current
}

module Counter = {
  @react.component
  let make = (~children, ~interval=1000, ~step=1) => {
    let (count, setCount) = React.useState(() => 0)

    React.useEffect2(() => {
      Js.Global.setInterval(() => {
        setCount(c => c + step)
      }, interval)->ignore
      None
    }, (interval, step))

    <div className="p-0"> <div> {count->Belt.Int.toString->React.string} </div> children </div>
  }
}
