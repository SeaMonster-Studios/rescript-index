// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "@rescript/std/lib/es6/belt_Array.js";
import * as ReactSpread from "@seamonster-studios/react-spread/src/ReactSpread.js";
import * as Downshift_MultipleSelection from "../src/Downshift_MultipleSelection.js";

function _DownshiftMultipleSelection$Close(Props) {
  var classNameOpt = Props.className;
  var className = classNameOpt !== undefined ? classNameOpt : "";
  return React.createElement("svg", {
              "aria-hidden": true,
              className: className,
              role: "img",
              focusable: "false",
              viewBox: "0 0 320 512",
              xmlns: "http://www.w3.org/2000/svg"
            }, React.createElement("path", {
                  d: "M310.6 361.4c12.5 12.5 12.5 32.75 0 45.25C304.4 412.9 296.2 416 288 416s-16.38-3.125-22.62-9.375L160 301.3L54.63 406.6C48.38 412.9 40.19 416 32 416S15.63 412.9 9.375 406.6c-12.5-12.5-12.5-32.75 0-45.25l105.4-105.4L9.375 150.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L160 210.8l105.4-105.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-105.4 105.4L310.6 361.4z",
                  fill: "currentColor"
                }));
}

var Close = {
  make: _DownshiftMultipleSelection$Close
};

function _DownshiftMultipleSelection$DownArrow(Props) {
  var classNameOpt = Props.className;
  var className = classNameOpt !== undefined ? classNameOpt : "";
  return React.createElement("svg", {
              className: className,
              height: "10",
              width: "16",
              fill: "none",
              viewBox: "0 0 16 10",
              xmlns: "http://www.w3.org/2000/svg"
            }, React.createElement("path", {
                  className: "stroke-current",
                  d: "M1 1L8 9L15 1",
                  stroke: "#22211D",
                  strokeLinecap: "round",
                  strokeLinejoin: "round",
                  strokeWidth: "2"
                }));
}

var DownArrow = {
  make: _DownshiftMultipleSelection$DownArrow
};

var Select = Downshift_MultipleSelection.Make({});

var allItems = [
  "Option 1",
  "Option 2",
  "Option 3",
  "Option 4",
  "Option 5",
  "Option 6"
];

function $$default(param) {
  var match = Curry.app(Select.use, [
        undefined,
        allItems,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        undefined
      ]);
  var multiSelect = match[1];
  var select = match[0];
  var items = Curry._2(Select.Utils.getFilteredItems, multiSelect, allItems);
  return React.createElement("div", {
              className: "flex flex-col m-16 items-start relative"
            }, React.createElement(ReactSpread.make, {
                  props: Curry._1(Select.getLabelProps, select),
                  children: React.createElement("label", undefined, "Choose options")
                }), multiSelect.selectedItems.length !== 0 ? React.createElement("div", {
                    className: "my-1 flex flex-wrap"
                  }, Belt_Array.mapWithIndex(multiSelect.selectedItems, (function (index, item) {
                          return React.createElement(ReactSpread.make, {
                                      props: multiSelect.getSelectedItemProps({
                                            item: item,
                                            index: index
                                          }),
                                      children: React.createElement("div", {
                                            className: "mr-2 mb-2"
                                          }, React.createElement("button", {
                                                className: "leading-3 flex items-center text-xs py-1 px-2 bg-black border-1 border-black text-white hover:bg-white hover:text-black transition-colors rounded-lg",
                                                type: "button",
                                                onClick: (function (param) {
                                                    multiSelect.removeSelectedItem(item);
                                                  })
                                              }, React.createElement("span", undefined, item), React.createElement(_DownshiftMultipleSelection$Close, {
                                                    className: "ml-2 w-2 h-auto"
                                                  }))),
                                      key: "" + String(index) + "-" + item + ""
                                    });
                        }))) : null, React.createElement(ReactSpread.make, {
                  props: select.getToggleButtonProps(multiSelect.getDropdownProps({
                            preventKeyAction: select.isOpen
                          })),
                  children: React.createElement("button", {
                        className: "peer flex focus:bg-black hover:bg-black focus:text-white hover:text-white items-center justify-between border duration-300 w-full border-black rounded-md px-3 py-1 transition-all",
                        type: "button"
                      }, React.createElement("span", {
                            className: "leading-5 py-[6px]"
                          }, "Options"), React.createElement(_DownshiftMultipleSelection$DownArrow, {
                            className: "ml-2 p-1 w-5 h-auto"
                          }))
                }), React.createElement(ReactSpread.make, {
                  props: Curry._1(Select.getMenuProps, select),
                  children: React.createElement("ul", {
                        className: "bg-white transition-opacity opacity-0 absolute z-10 peer-aria-expanded:opacity-100 max-h-40 overflow-y-auto w-full top-full mt-1 shadow-md"
                      }, select.isOpen ? React.createElement(React.Fragment, undefined, Belt_Array.mapWithIndex(items, (function (index, item) {
                                    return React.createElement(ReactSpread.make, {
                                                props: Curry._2(Select.getItemProps, select, {
                                                      item: item,
                                                      index: index
                                                    }),
                                                children: React.createElement("li", {
                                                      key: "" + item + "" + String(index) + "",
                                                      className: "text-sm py-3 px-3 first:rounded-t border leading-4 aria-selected:text-white aria-selected:bg-black border-l-black border-r-black last:rounded-b hover:cursor-pointer hover:bg-black hover:text-white  transition-colors duration-500\n    							"
                                                    }, item),
                                                key: "" + item + "" + String(index) + ""
                                              });
                                  }))) : null)
                }));
}

export {
  Close ,
  DownArrow ,
  Select ,
  allItems ,
  $$default ,
  $$default as default,
}
/* Select Not a pure module */
