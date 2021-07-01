type highlightedIndex = int
type isOpen = bool

@module("downshift") @scope("useSelect")
external stateChangeTypes: {
  "MenuKeyDownArrowDown": string,
  "MenuKeyDownArrowUp": string,
  "MenuKeyDownEscape": string,
  "MenuKeyDownHome": string,
  "MenuKeyDownEnd": string,
  "MenuKeyDownEnter": string,
  "MenuKeyDownCharacter": string,
  "MenuBlur": string,
  "ItemHover": string,
  "ItemClick": string,
  "ToggleButtonKeyDownCharacter": string,
  "ToggleButtonKeyDownArrowDown": string,
  "ToggleButtonKeyDownArrowUp": string,
  "ToggleButtonClick": string,
  "FunctionToggleMenu": string,
  "FunctionOpenMenu": string,
  "FunctionCloseMenu": string,
  "FunctionSetHighlightedIndex": string,
  "FunctionSelectItem": string,
  "FunctionClearKeysSoFar": string,
  "FunctionReset": string,
} = "stateChangeTypes"

type toggleButtonProps = {
  "aria-expanded": bool,
  "aria-haspopup": string,
  "aria-labelledby": string,
  "id": string,
  @meth
  "onClick": ReactEvent.Mouse.t => unit,
  @meth
  "onKeyDown": ReactEvent.Keyboard.t => unit,
  "ref": ReactDOM.Ref.t,
}

type labelProps = {"id": string, "htmlFor": string}

type menuProps = {
  "aria-labelledby": string,
  "id": string,
  @meth
  "onBlur": ReactEvent.Focus.t => unit,
  @meth
  "onKeyDown": ReactEvent.Keyboard.t => unit,
  @meth
  "onMouseLeave": ReactEvent.Mouse.t => unit,
  "ref": ReactDOM.Ref.t,
  "role": string,
  "tabIndex": int,
}

type itemProps = {
  "role": string,
  "id": string,
  @meth
  "onClick": ReactEvent.Mouse.t => unit,
  @meth
  "onMouseMove": ReactEvent.Mouse.t => unit,
  "ref": ReactDOM.Ref.t,
}

@deriving(abstract)
type createGetItemPropsParams<'i> = {
  @optional
  index: highlightedIndex,
  @optional
  item: 'i,
}

type state<'i> = {
  "highlightedIndex": highlightedIndex,
  "isOpen": bool,
  "keysSoFar": string,
  "selectedItem": Js.Nullable.t<'i>,
}

type actionAndChanges<'i> = {
  "changes": state<'i>,
  "type": string,
  "props": {
    "items": array<'i>,
    "initialSelectedItem": 'i,
    @meth
    "itemToString": 'i => string,
    @meth
    "getA11ySelectionMessage": unit => string,
    @meth
    "getA11yStatusMessage": unit => string,
    @meth
    "scrollIntoView": (ReactDOM.Ref.t, ReactDOM.Ref.t) => unit,
    @meth
    "stateReducer": (state<'i>, state<'i>) => state<'i>,
  },
}

@deriving(abstract)
type createUseSelectParams<'i> = {
  items: array<'i>,
  @optional
  initialSelectedItem: 'i,
  @optional
  itemToString: 'i => string,
  @optional
  onSelectedItemChange: state<'i> => unit,
  @optional
  stateReducer: (state<'i>, actionAndChanges<'i>) => state<'i>,
  @optional
  initialIsOpen: isOpen,
  @optional
  initialHighlightedIndex: highlightedIndex,
  @optional
  defaultSelectedItem: 'i,
  @optional
  defaultIsOpen: isOpen,
  @optional
  defaultHighlightedIndex: highlightedIndex,
  @optional
  getA11yStatusMessage: unit => string,
  @optional
  getA11ySelectionMessage: unit => string,
  @optional
  onHighlightedIndexChange: state<'i> => unit,
  @optional
  onIsOpenChange: state<'i> => unit,
  @optional
  onStateChange: state<'i> => unit,
  @optional
  highlightedIndex: highlightedIndex,
  @optional
  selectedItem: 'i,
  @optional
  id: string,
  @optional
  labelId: string,
  @optional
  menuId: string,
  @optional
  toggleButtonId: string,
  @optional
  getItemId: string,
  @optional
  circularNavigation: bool,
}

type useSelectValue<'i> = {
  "isOpen": isOpen,
  "selectedItem": Js.Nullable.t<'i>,
  "highlightedIndex": highlightedIndex,
  @meth
  "getToggleButtonProps": unit => toggleButtonProps,
  @meth
  "getLabelProps": unit => labelProps,
  @meth
  "getMenuProps": unit => menuProps,
  @ocaml.doc("Usage: getItemProps(createGetItemPropsParams(~index=0, ())) ") @meth
  "getItemProps": createGetItemPropsParams<'i> => itemProps,
  "toggleMenu": unit => unit,
  "selectItem": 'i => unit,
  "openMenu": unit => unit,
  "closeMenu": unit => unit,
  "reset": unit => unit,
  @meth
  "setHighlightedIndex": highlightedIndex => unit,
}

@module("downshift")
external useSelect: createUseSelectParams<'i> => useSelectValue<'i> = "useSelect"

@@ocaml.doc("Usage: useSelect(createUseSelectParams(~items=options, ())); ")
