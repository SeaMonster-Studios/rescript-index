type dayjs

@module external now: unit => dayjs = "dayjs"

@module external dayjs: string => dayjs = "dayjs"

@send external format: (dayjs, string) => string = "format"

@send
external diff: (
  dayjs,
  dayjs,
  @string
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
