type t

@module external now: unit => t = "dayjs"

@module external dayjs: string => t = "dayjs"

@send external format: (t, string) => string = "format"

@send
external diff: (
  t,
  t,
  [
    | #millisecond
    | #second
    | #minute
    | #hour
    | #day
    | #week
    | #quarter
    | #month
    | #year
  ],
  bool,
) => float = "diff"
