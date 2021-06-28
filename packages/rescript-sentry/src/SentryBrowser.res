open Sentry

@module("@sentry/browser")
external make: option<options> => unit = "init"

@module("@sentry/browser")
external capturePromiseException: Js.Promise.error => unit = "captureException"

@module("@sentry/browser")
external captureException: 'a => unit = "captureException"

@module("@sentry/browser")
external captureMessage: string => unit = "captureMessage"

@module("@sentry/browser")
external showReportDialog: unit => unit = "showReportDialog"

@module("@sentry/browser")
external withScope: scope => unit = "withScope"
