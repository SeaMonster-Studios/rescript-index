open Belt

external nullElement: Js.Nullable.t<'a> => Dom.element = "%identity"

@val
external document: 'a = "document"

let useIdRef = id => {
  let el = document["getElementById"](id)->Option.getWithDefault(Js.Nullable.null->nullElement)
  let ref_ = React.useRef(el)

  React.useEffect2(() => {
    ref_.current = el

    None
  }, (ref_, el))

  ref_
}
