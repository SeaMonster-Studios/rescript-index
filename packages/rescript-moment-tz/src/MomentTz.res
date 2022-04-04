type t

/* Parse */
@module
external make: unit => t = "moment-timezone"

@module
external ofString: string => t = "moment-timezone"

@send
external clone: t => t = "clone"

@send
external tz: (t, string) => t = "tz"

/* Display */
@send
external fromNow: t => string = "fromNow"

type diff = [#weeks | #days | #hours | #minutes | #seconds]
@send
external diff: (t, t, diff) => int = "diff"

@send
external unix: t => float = "unix"

@send
external format: (t, string) => string = "format"

@send
external toISOString: t => string = "toISOString"

/* Query */
@send
external isBefore: (t, t) => bool = "isBefore"

@send
external isAfter: (t, t) => bool = "isAfter"

@send
external valueOf: t => float = "valueOf"

type betweenInclusivity = [#"()" | #"[)" | #"(]" | #"[]"]
@send
external isBetween: (t, t, t, Js.undefined<string>, betweenInclusivity) => bool = "isBetween"

/* Get + Set */
@send
external getDay: t => int = "day"

@send
external getDate: t => int = "date"

@send
external getYear: t => int = "year"

@send
external getMonth: t => int = "month"

@send
external getHour: t => int = "hour"

@send
external getMinute: t => int = "minute"

@send 
external setMonth: (t, int) => unit = "month"

@scope("tz") @set
external setDefaultTimezone: (t, string) => unit = "setDefault"

/* Manipulate */
type timeUnit = [
  | #years
  | #quarters
  | #months
  | #weeks
  | #days
  | #hours
  | #minutes
  | #seconds
  | #milliseconds
]

@send
external add: (t, int, timeUnit) => unit = "add"

@send
external subtract: (t, int, timeUnit) => unit = "subtract"

@send
external startOf: (t, diff) => unit = "startOf"

/* Timezone */
@module("moment-timezone")
external ofTimezone: (string, string) => t = "tz"
let ofTimezone = (~date, ~timezone) => ofTimezone(date, timezone)

@module("moment-timezone") @scope("tz")
external getTimezoneNames: unit => array<string> = "names"
