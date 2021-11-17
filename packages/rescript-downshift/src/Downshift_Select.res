module type Config = {
  type item

  // options may not be array<item> when it's used in conjunction w/useMultipleSelection
  type optionType
}

module StateChangeTypes = {
  type t

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownArrowDown: t = "MenuKeyDownArrowDown"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownArrowUp: t = "MenuKeyDownArrowUp"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownEscape: t = "MenuKeyDownEscape"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownHome: t = "MenuKeyDownHome"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownEnd: t = "MenuKeyDownEnd"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownEnter: t = "MenuKeyDownEnter"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownSpaceButton: t = "MenuKeyDownSpaceButton"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuKeyDownCharacter: t = "MenuKeyDownCharacter"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuBlur: t = "MenuBlur"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external menuMouseLeave: t = "MenuMouseLeave"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external itemMouseMove: t = "ItemMouseMove"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external itemClick: t = "ItemClick"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external toggleButtonKeyDownCharacter: t = "ToggleButtonKeyDownCharacter"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external toggleButtonKeyDownArrowDown: t = "ToggleButtonKeyDownArrowDown"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external toggleButtonKeyDownArrowUp: t = "ToggleButtonKeyDownArrowUp"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external toggleButtonClick: t = "ToggleButtonClick"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionToggleMenu: t = "FunctionToggleMenu"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionOpenMenu: t = "FunctionOpenMenu"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionCloseMenu: t = "FunctionCloseMenu"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionSetHighlightedIndex: t = "FunctionSetHighlightedIndex"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionSelectItem: t = "FunctionSelectItem"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionSetInputValue: t = "FunctionSetInputValue"

  @module("downshift") @scope(("useSelect", "stateChangeTypes"))
  external functionReset: t = "FunctionReset"
}

module Make = (Config: Config) => {
  /*
		Docs: https://github.com/downshift-js/downshift/tree/master/src/hooks/useSelect
	*/

  type item = Config.item

  type changes = {
    isOpen: option<bool>,
    selectedItem: option<item>,
    highlightedIndex: option<int>,
    inputValue: option<string>,
    @as("type")
    type_: option<StateChangeTypes.t>,
  }

  type state = {
    isOpen: bool,
    selectedItem: item,
    highlightedIndex: int,
    inputValue: option<string>,
    keysSoFar: string,
  }

  external changesToState: changes => state = "%identity"

  type props

  type actionAndChanges = {
    changes: changes,
    @as("type")
    type_: StateChangeTypes.t,
    props: props,
    index: int,
  }

  type getA11yMessage = {
    highlightedIndex: int,
    highlightedItem: item,
    inputValue: string,
    isOpen: bool,
    itemToString: item => string,
    previousResultCount: int,
    resultCount: int,
    selectedItem: item,
  }

  type highlightedIndexChange = {
    changes: changes,
    highlightedIndex: int,
    stateChangeTypes: StateChangeTypes.t,
  }

  type isOpenChange = {
    changes: changes,
    isOpen: bool,
  }

  @deriving(abstract) @uncurry
  type options<'environment> = {
    items: array<Config.optionType>,
    @optional
    itemToString: item => string,
    @optional
    onSelectedItemChange: changes => unit,
    @optional
    stateReducer: (state, actionAndChanges) => state,
    @optional
    initialSelectedItem: item,
    @optional
    initialIsOpen: bool,
    @optional
    initialHighlightedIndex: int,
    @optional
    defaultSelectedItem: item,
    @optional
    defaultIsOpen: bool,
    @optional
    defaultHighlightedIndex: int,
    @optional
    getA11yStatusMessage: getA11yMessage => string,
    @optional
    getA11ySelectionMessage: getA11yMessage => string,
    @optional
    onHighlightedIndexChange: highlightedIndexChange => unit,
    @optional
    onIsOpenChange: isOpenChange => unit,
    @optional
    onStateChange: changes => unit,
    @optional
    highlightedIndex: int,
    @optional
    isOpen: bool,
    @optional
    selectedItem: Js.Nullable.t<item>,
    @optional
    id: string,
    @optional
    labelId: string,
    @optional
    menuId: string,
    @optional
    toggleButtonId: string,
    @optional
    getItemId: item => string,
    @optional
    environment: 'environment,
    @optional
    circularNavigation: bool,
  }

  type toggleButtonProps

  type labelProps

  type menuProps

  type itemProps

  type t = {
    isOpen: bool,
    selectedItem: Js.Nullable.t<item>,
    highlightedIndex: int,
  }

  @send @uncurry
  external getToggleButtonProps: (t, 'a) => toggleButtonProps = "getToggleButtonProps"

  @send @uncurry
  external getLabelProps: t => labelProps = "getLabelProps"

  @send @uncurry
  external getMenuProps: t => menuProps = "getMenuProps"

  type itemPropsOptions = {
    item: item,
    index: int,
  }

  @send @uncurry
  external getItemProps: (t, itemPropsOptions) => itemProps = "getItemProps"

  @module("downshift") @uncurry
  external use: options<'environment> => t = "useSelect"
}
