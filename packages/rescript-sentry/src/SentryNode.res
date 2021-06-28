open Sentry

@module("@sentry/node")
external make: option<options> => unit = "init"

@module("@sentry/node")
external capturePromiseException: Js.Promise.error => unit = "captureException"

@module("@sentry/node")
external captureException: 'a => unit = "captureException"

@module("@sentry/node")
external captureMessage: string => unit = "captureMessage"

@module("@sentry/node")
external withScope: scope => unit = "withScope"
