// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";
import * as Caml_obj from "@rescript/std/lib/es6/caml_obj.js";
import * as Downshift from "downshift";
import * as Belt_Array from "@rescript/std/lib/es6/belt_Array.js";
import * as Belt_Option from "@rescript/std/lib/es6/belt_Option.js";
import * as Caml_option from "@rescript/std/lib/es6/caml_option.js";
import * as Downshift_Select from "./Downshift_Select.js";

function Make(Config) {
  var Select = Downshift_Select.Make({});
  var getLabelProps = function (prim) {
    return prim.getLabelProps();
  };
  var getLabelPropsWithOptions = function (prim0, prim1) {
    return prim0.getLabelProps(prim1);
  };
  var getToggleButtonProps = function (prim) {
    return prim.getToggleButtonProps();
  };
  var getToggleButtonPropsWithOptions = function (prim0, prim1) {
    return prim0.getToggleButtonProps(prim1);
  };
  var getMenuProps = function (prim) {
    return prim.getMenuProps();
  };
  var getMenuPropsWithOptions = function (prim0, prim1) {
    return prim0.getMenuProps(prim1);
  };
  var getItemProps = function (prim0, prim1) {
    return prim0.getItemProps(prim1);
  };
  var getFilteredItems = function (t, items) {
    return Belt_Array.keep(items, (function (i) {
                  return !Belt_Array.some(t.selectedItems, (function (item) {
                                return Caml_obj.equal(item, i);
                              }));
                }));
  };
  var handleStateReducer = function (callback, state, actionAndChanges) {
    var x = actionAndChanges.type;
    if (!(Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.MenuKeyDownEnter) || Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.MenuKeyDownSpaceButton) || Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.ItemClick) || Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.ToggleButtonClick))) {
      return state;
    }
    var init = actionAndChanges.changes;
    var newState = Curry._2(Select.changesToState, {
          isOpen: actionAndChanges.changes.isOpen,
          selectedItem: init.selectedItem,
          highlightedIndex: init.highlightedIndex,
          inputValue: init.inputValue,
          type: init.type
        }, state);
    if (callback !== undefined) {
      return Curry._1(callback, newState);
    } else {
      return newState;
    }
  };
  var handleOnStateChange = function (callback, multi, changes) {
    var match = changes.selectedItem;
    var match$1 = changes.type;
    if (match == null) {
      return ;
    }
    if (match$1 === undefined) {
      return ;
    }
    var x = Caml_option.valFromOption(match$1);
    if (Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.MenuKeyDownEnter) || Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.MenuKeyDownSpaceButton) || Caml_obj.equal(x, Downshift.useSelect.stateChangeTypes.ItemClick)) {
      multi.addSelectedItem(match);
      if (callback !== undefined) {
        return Curry._1(callback, undefined);
      } else {
        return ;
      }
    }
    
  };
  var Utils = {
    getFilteredItems: getFilteredItems,
    handleStateReducer: handleStateReducer,
    handleOnStateChange: handleOnStateChange
  };
  var use = function (initialSelectedItemsOpt, items, itemToString, onSelectedItemChange, stateReducer, stateReducerOverride, initialSelectedItem, initialIsOpen, initialHighlightedIndex, defaultSelectedItem, defaultIsOpen, defaultHighlightedIndex, getA11yStatusMessage, getA11ySelectionMessage, onHighlightedIndexChange, onIsOpenChange, onStateChange, onStateChangeOverride, highlightedIndex, isOpen, selectedItem, id, labelId, menuId, toggleButtonId, getItemId, environment, circularNavigation, param) {
    var initialSelectedItems = initialSelectedItemsOpt !== undefined ? initialSelectedItemsOpt : [];
    var multi = Downshift.useMultipleSelection({
          initialSelectedItems: initialSelectedItems
        });
    var tmp = {
      items: getFilteredItems(multi, items),
      stateReducer: Belt_Option.getWithDefault(stateReducerOverride, (function (state, changes) {
              return handleStateReducer(stateReducer, state, changes);
            })),
      onStateChange: Belt_Option.getWithDefault(onStateChangeOverride, (function (changes) {
              handleOnStateChange(onStateChange, multi, changes);
            }))
    };
    if (itemToString !== undefined) {
      tmp.itemToString = Caml_option.valFromOption(itemToString);
    }
    if (onSelectedItemChange !== undefined) {
      tmp.onSelectedItemChange = Caml_option.valFromOption(onSelectedItemChange);
    }
    if (initialSelectedItem !== undefined) {
      tmp.initialSelectedItem = Caml_option.valFromOption(initialSelectedItem);
    }
    if (initialIsOpen !== undefined) {
      tmp.initialIsOpen = Caml_option.valFromOption(initialIsOpen);
    }
    if (initialHighlightedIndex !== undefined) {
      tmp.initialHighlightedIndex = Caml_option.valFromOption(initialHighlightedIndex);
    }
    if (defaultSelectedItem !== undefined) {
      tmp.defaultSelectedItem = Caml_option.valFromOption(defaultSelectedItem);
    }
    if (defaultIsOpen !== undefined) {
      tmp.defaultIsOpen = Caml_option.valFromOption(defaultIsOpen);
    }
    if (defaultHighlightedIndex !== undefined) {
      tmp.defaultHighlightedIndex = Caml_option.valFromOption(defaultHighlightedIndex);
    }
    if (getA11yStatusMessage !== undefined) {
      tmp.getA11yStatusMessage = Caml_option.valFromOption(getA11yStatusMessage);
    }
    if (getA11ySelectionMessage !== undefined) {
      tmp.getA11ySelectionMessage = Caml_option.valFromOption(getA11ySelectionMessage);
    }
    if (onHighlightedIndexChange !== undefined) {
      tmp.onHighlightedIndexChange = Caml_option.valFromOption(onHighlightedIndexChange);
    }
    if (onIsOpenChange !== undefined) {
      tmp.onIsOpenChange = Caml_option.valFromOption(onIsOpenChange);
    }
    if (highlightedIndex !== undefined) {
      tmp.highlightedIndex = Caml_option.valFromOption(highlightedIndex);
    }
    if (isOpen !== undefined) {
      tmp.isOpen = Caml_option.valFromOption(isOpen);
    }
    if (selectedItem !== undefined) {
      tmp.selectedItem = Caml_option.valFromOption(selectedItem);
    }
    if (id !== undefined) {
      tmp.id = Caml_option.valFromOption(id);
    }
    if (labelId !== undefined) {
      tmp.labelId = Caml_option.valFromOption(labelId);
    }
    if (menuId !== undefined) {
      tmp.menuId = Caml_option.valFromOption(menuId);
    }
    if (toggleButtonId !== undefined) {
      tmp.toggleButtonId = Caml_option.valFromOption(toggleButtonId);
    }
    if (getItemId !== undefined) {
      tmp.getItemId = Caml_option.valFromOption(getItemId);
    }
    if (environment !== undefined) {
      tmp.environment = Caml_option.valFromOption(environment);
    }
    if (circularNavigation !== undefined) {
      tmp.circularNavigation = Caml_option.valFromOption(circularNavigation);
    }
    var select = Downshift.useSelect(tmp);
    return [
            select,
            multi
          ];
  };
  return {
          Select: Select,
          StateChangeTypes: undefined,
          getLabelProps: getLabelProps,
          getLabelPropsWithOptions: getLabelPropsWithOptions,
          getToggleButtonProps: getToggleButtonProps,
          getToggleButtonPropsWithOptions: getToggleButtonPropsWithOptions,
          getMenuProps: getMenuProps,
          getMenuPropsWithOptions: getMenuPropsWithOptions,
          getItemProps: getItemProps,
          Utils: Utils,
          use: use
        };
}

export {
  Make ,
}
/* downshift Not a pure module */
