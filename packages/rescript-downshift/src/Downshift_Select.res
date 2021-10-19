module type Config = {
  type item
}

module Make = (Config: Config) => {
  /*
		Docs: https://github.com/downshift-js/downshift/tree/master/src/hooks/useSelect
	*/

  include Config

  type items = array<item>

  type stateChangeTypes

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

    @module("downstft") @scope(("useSelect", "stateChangeTypes"))
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

  type changes<'changes> = Js.t<'changes>

  type actionAndChanges<'changes> = {
    changes: 'changes,
    @as("type")
    type_: StateChangeTypes.t,
  }

  type state = {
    highlightedIndex: int,
    isOpen: bool,
    selectedItem: item,
    keysSoFar: string,
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

  type highlightedIndexChange<'changes> = {
    changes: changes<'changes>,
    highlightedIndex: int,
    stateChangeTypes: StateChangeTypes.t,
  }

  type isOpenChange<'changes> = {
    changes: changes<'changes>,
    isOpen: bool,
  }

  @deriving(abstract)
  type options<'changes, 'environment> = {
    items: items,
    @optional
    itemToString: item => string,
    @optional
    onSelectedItemChange: changes<'changes> => unit,
    @optional
    stateReducer: (state, actionAndChanges<'changes>) => unit,
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
    onHighlightedIndexChange: highlightedIndexChange<'changes> => unit,
    @optional
    onIsOpenChange: isOpenChange<'changes> => unit,
    @optional
    onStateChange: changes<'changes> => unit,
    @optional
    highlightedIndex: int,
    @optional
    isOpen: bool,
    @optional
    selectedItem: item,
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

  @send
  external getToggleButtonProps: t => toggleButtonProps = "getToggleButtonProps"

  @send
  external getLabelProps: t => labelProps = "getLabelProps"

  @send
  external getMenuProps: t => menuProps = "getMenuProps"

  @deriving(abstract)
  type itemPropsOptions = {
    @optional
    item: item,
    index: int,
  }

  @send
  external getItemProps: (t, itemPropsOptions) => itemProps = "getItemProps"

  @module("downshift") @uncurry
  external use: options<'changes, 'environment> => t = "useSelect"
}
