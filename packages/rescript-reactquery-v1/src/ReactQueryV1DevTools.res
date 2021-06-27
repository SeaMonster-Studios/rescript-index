// https://github.com/tannerlinsley/react-query-devtools
@deriving(abstract)
type props = {
  @optional
  className: string,
  @optional
  style: ReactDOMStyle.t,
}

@module("react-query-devtools") @react.component
external make: (
  ~initialIsOpen: bool=?,
  ~className: string=?,
  ~panelProps: props=?,
  ~closeButtonProps: props=?,
  ~toggleButtonProps: props=?,
) => React.element = "ReactQueryDevtools"
