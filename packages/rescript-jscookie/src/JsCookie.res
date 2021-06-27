@deriving(abstract)
type options = {
  @optional
  path: string,
  @optional
  expires: float,
  @optional
  domain: string,
  @optional
  secure: bool,
}

@module("js-cookie")
external set: (~name: string, ~value: string, ~options: options=?, unit) => unit = "set"

@module("js-cookie")
external get: string => Js.Nullable.t<string> = "get"

@module("js-cookie")
external getJson: string => Js.Nullable.t<Js.Json.t> = "getJSON"

@module("js-cookie") external remove: string => unit = "remove"
