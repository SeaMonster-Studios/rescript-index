@react.component @module("./ErrorBoundary.js")
external make: (
  ~children: React.element,
  ~onError: ('e, 'i) => unit=?,
  ~renderFallback: ('e, 'i) => React.element=?,
) => React.element = "ErrorBoundary"
