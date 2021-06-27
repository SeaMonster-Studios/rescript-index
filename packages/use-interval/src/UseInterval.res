let use = (callback: unit => unit, delay) => {
  let savedCallback = React.useRef(() => ())

  React.useEffect1(() => {
    savedCallback.current = callback
    Some(() => ())
  }, [callback])

  React.useEffect1(() => {
    let tick = () => {
      savedCallback.current()
    }
    switch delay {
    | None => Some(() => ())
    | Some(delay) =>
      let id = Js.Global.setInterval(tick, delay)
      Some(() => id->Js.Global.clearInterval)
    }
  }, [delay])
}
