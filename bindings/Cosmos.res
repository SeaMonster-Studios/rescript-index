type useValueProps<'value> = {defaultValue: 'value}

@module("react-cosmos/fixture")
external useValue: (string, useValueProps<'value>) => ('value, 'value => unit) = "useValue"

type useSelectProps<'value> = {options: array<'value>}

@module("react-cosmos/fixture")
external useSelect: (string, useSelectProps<'value>) => ('value, 'value => unit) = "useSelect"
