let use = (value: 'a) => {
  let reference = React.useRef(value)
  React.useEffect1(() => {
    reference.current = value
    Some(() => ())
  }, [value])
  reference.current
}
