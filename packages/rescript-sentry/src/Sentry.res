type scope = {@meth "setExtra": (string, string) => unit}

type event
type eventHint
type breadcrumb
type breadcrumbHint
type integration
type transport

@deriving(abstract)
type options = {
  @optional
  blacklistUrls: array<Js.Re.t>,
  @optional
  whitelistUrls: array<Js.Re.t>,
  @optional
  debug: bool,
  @optional
  enabled: bool,
  @optional
  dsn: string,
  @optional
  defaultIntegrations: integration,
  @optional
  integrations: array<integration>,
  @optional
  ignoreErrors: array<Js.Re.t>,
  @optional
  transport: transport,
  @optional
  transportOptions: Js.Dict.t<string>,
  @optional
  release: string,
  @optional
  environment: string,
  @optional
  dist: string,
  @optional
  maxBreadcrumbs: int,
  @optional
  logLevel: int,
  @optional
  sampelRage: int,
  @optional
  attachStacktrace: bool,
  @optional
  beforeSend: (~event: event, ~hint: eventHint=?) => Js.Promise.t<Js.Nullable.t<event>>,
  @optional
  beforeBreadcrumb: (
    ~breadcrumb: breadcrumb,
    ~hint: breadcrumbHint=?,
  ) => Js.Promise.t<Js.Nullable.t<event>>,
}
