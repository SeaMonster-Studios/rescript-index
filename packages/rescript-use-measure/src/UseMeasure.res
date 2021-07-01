type resizeObserverPolyfill

@module("@juggle/resize-observer")
external polyfill: resizeObserverPolyfill = "ResizeObserver"

type debounce = {
  scroll: int,
  resize: float,
}

@deriving(abstract)
type params = {
  @optional
  polyfill: resizeObserverPolyfill,
  @optional
  debounce: debounce,
  @optional
  scroll: bool,
}

@module("react")
external useEffect2: (@uncurry (unit => option<unit => unit>), ('a, 'b)) => unit = "useEffect"

type bounds = {
  width: int,
  height: int,
  left: float,
  top: float,
  bottom: float,
  right: float,
  x: float,
  y: float,
}

@module("react-use-measure")
external useHook: params => (ReactDOM.Ref.t, bounds) = "default"
