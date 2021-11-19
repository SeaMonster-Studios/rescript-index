open Belt

module type Config = {
  type item
}

module Make = (Config: Config) => {
  /*
		Docs: https://github.com/downshift-js/downshift/tree/master/src/hooks/useMultipleSelection
		https://www.downshift-js.com/use-multiple-selection#other-usage-examples
	*/

  include Config

  module Select = Downshift_Select.Make({
    type item = Config.item
    type optionType = Config.item
  })

  module StateChangeTypes = Downshift_Select.StateChangeTypes

  let getLabelProps = Select.getLabelProps

  let getLabelPropsWithOptions = Select.getLabelPropsWithOptions

  let getToggleButtonProps = Select.getToggleButtonProps

  let getToggleButtonPropsWithOptions = Select.getToggleButtonPropsWithOptions

  let getMenuProps = Select.getMenuProps

  let getMenuPropsWithOptions = Select.getMenuPropsWithOptions

  let getItemProps = Select.getItemProps

  type items = array<item>

  type t = {selectedItems: items}

  type options = {initialSelectedItems: items}

  type selectedItemProps = {
    item: item,
    index: int,
  }

  @deriving(abstract)
  type dropdownPropsOptions = {
    @optional
    preventKeyAction: bool,
  }

  @send
  external getSelectedItemProps: (t, selectedItemProps) => Select.props<'a> = "getSelectedItemProps"

  @send
  external getDropdownProps: (t, dropdownPropsOptions) => Select.props<'a> = "getDropdownProps"

  @send
  external addSelectedItem: (t, item) => unit = "addSelectedItem"

  @send
  external removeSelectedItem: (t, item) => unit = "removeSelectedItem"

  @module("downshift") @uncurry
  external useMultipleSelection: options => t = "useMultipleSelection"

  module Utils = {
    let getFilteredItems = (t, items) =>
      items->Array.keep(i => !(t.selectedItems->Array.some(item => item == i)))

    let handleStateReducer = {
      open StateChangeTypes
      open Select

      (~callback=?, state, actionAndChanges) => {
        switch actionAndChanges.type_ {
        | x
          if x == menuKeyDownEnter ||
          x == menuKeyDownSpaceButton ||
          x == itemClick ||
          x == toggleButtonClick =>
          let newState = {
            ...actionAndChanges.changes,
            isOpen: actionAndChanges.changes.isOpen,
          }->Select.changesToState(state)

          switch callback {
          | None => newState
          | Some(callback) => callback(newState)
          }

        | _ => state
        }
      }
    }

    let handleOnStateChange = {
      (~callback=?, multi: t, changes: Select.changes) => {
        switch (changes.selectedItem->Js.Nullable.toOption, changes.type_) {
        | (Some(selectedItem), Some(x: StateChangeTypes.t)) =>
          open StateChangeTypes
          if x == menuKeyDownEnter || x == menuKeyDownSpaceButton || x == itemClick {
            multi->addSelectedItem(selectedItem)
            switch callback {
            | None => ()
            | Some(callback) => callback()
            }
          }
        | _ => ()
        }
      }
    }
  }

  let use = (
    ~initialSelectedItems: items=[],
    ~items,
    ~itemToString=?,
    ~onSelectedItemChange=?,
    ~stateReducer=?,
    ~stateReducerOverride=?,
    ~initialSelectedItem=?,
    ~initialIsOpen=?,
    ~initialHighlightedIndex=?,
    ~defaultSelectedItem=?,
    ~defaultIsOpen=?,
    ~defaultHighlightedIndex=?,
    ~getA11yStatusMessage=?,
    ~getA11ySelectionMessage=?,
    ~onHighlightedIndexChange=?,
    ~onIsOpenChange=?,
    ~onStateChange=?,
    ~onStateChangeOverride=?,
    ~highlightedIndex=?,
    ~isOpen=?,
    ~selectedItem=?,
    ~id=?,
    ~labelId=?,
    ~menuId=?,
    ~toggleButtonId=?,
    ~getItemId=?,
    ~environment=?,
    ~circularNavigation=?,
    (),
  ) => {
    let multi = useMultipleSelection({initialSelectedItems: initialSelectedItems})

    let select = Select.use(
      Select.options(
        ~items={multi->Utils.getFilteredItems(items)},
        ~itemToString?,
        ~onSelectedItemChange?,
        ~stateReducer=stateReducerOverride->Option.getWithDefault((state, changes) =>
          Utils.handleStateReducer(~callback=?stateReducer, state, changes)
        ),
        ~initialSelectedItem?,
        ~initialIsOpen?,
        ~initialHighlightedIndex?,
        ~defaultSelectedItem?,
        ~defaultIsOpen?,
        ~defaultHighlightedIndex?,
        ~getA11yStatusMessage?,
        ~getA11ySelectionMessage?,
        ~onHighlightedIndexChange?,
        ~onIsOpenChange?,
        ~onStateChange=onStateChangeOverride->Option.getWithDefault(changes =>
          Utils.handleOnStateChange(~callback=?onStateChange, multi, changes)
        ),
        ~highlightedIndex?,
        ~isOpen?,
        ~selectedItem?,
        ~id?,
        ~labelId?,
        ~menuId?,
        ~toggleButtonId?,
        ~getItemId?,
        ~environment?,
        ~circularNavigation?,
        (),
      ),
    )

    (select, multi)
  }
}
