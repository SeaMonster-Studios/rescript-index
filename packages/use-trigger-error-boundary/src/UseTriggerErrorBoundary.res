let use = () => {
  let (error, setError) = React.useState(() => false)

  React.useCallback2(() => {
    let makeError: bool => unit = %raw(`
      function () {
        // eslint-disable-next-line
        error.nothingHere()
      }
    `) // eslint-disable-next-line

    makeError(error)
  }, (error, setError))
}
