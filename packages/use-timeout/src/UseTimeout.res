let use = (callback, delay) => {
  let timeoutRef = React.useRef(None)
  let savedCallback = React.useRef(callback)

  React.useEffect1(() => {
    savedCallback.current = callback
    None
  }, [callback])

  React.useEffect1(() => {
    timeoutRef.current = Js.Global.setTimeout(savedCallback.current, delay)->Some
    Some(() => timeoutRef.current->Belt.Option.forEach(Js.Global.clearTimeout))
  }, [delay])
  timeoutRef
}
