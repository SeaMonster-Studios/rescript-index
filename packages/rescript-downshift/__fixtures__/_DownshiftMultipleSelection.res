open Belt
open Downshift

module Close = {
  @react.component
  let make = (~className="") => {
    <svg
      className
      ariaHidden={true}
      focusable="false"
      role="img"
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 320 512">
      <path
        fill="currentColor"
        d="M310.6 361.4c12.5 12.5 12.5 32.75 0 45.25C304.4 412.9 296.2 416 288 416s-16.38-3.125-22.62-9.375L160 301.3L54.63 406.6C48.38 412.9 40.19 416 32 416S15.63 412.9 9.375 406.6c-12.5-12.5-12.5-32.75 0-45.25l105.4-105.4L9.375 150.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L160 210.8l105.4-105.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-105.4 105.4L310.6 361.4z"
      />
    </svg>
  }
}

module DownArrow = {
  @react.component
  let make = (~className="") => {
    <svg
      width="16"
      className
      height="10"
      viewBox="0 0 16 10"
      fill="none"
      xmlns="http://www.w3.org/2000/svg">
      <path
        d="M1 1L8 9L15 1"
        stroke="#22211D"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        className="stroke-current"
      />
    </svg>
  }
}

module Select = MultipleSelection.Make({
  type item = string
})

open! Select

let allItems = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6"]

let default = () => {
  let (select, multiSelect) = use(~items=allItems, ())
  let items = multiSelect->Utils.getFilteredItems(allItems)
  let itemToString = item => item

  <div className={`flex flex-col m-16 items-start relative`}>
    <ReactSpread props={select->getLabelProps}>
      <label> {"Choose options"->React.string} </label>
    </ReactSpread>
    {switch multiSelect.selectedItems->Array.length > 0 {
    | false => React.null
    | true =>
      <div className="my-1 flex flex-wrap">
        {multiSelect.selectedItems
        ->Array.mapWithIndex((index, item) => {
          let itemString = item->itemToString

          <ReactSpread
            key={`${index->string_of_int}-${itemString}`}
            props={multiSelect->getSelectedItemProps({index: index, item: item})}>
            <div className="mr-2 mb-2">
              <button
                type_="button"
                onClick={_ => multiSelect->removeSelectedItem(item)}
                className={`leading-3 flex items-center text-xs py-1 px-2 bg-black border-1 border-black text-white hover:bg-white hover:text-black transition-colors rounded-lg`}>
                <span> {itemString->React.string} </span> <Close className="ml-2 w-2 h-auto" />
              </button>
            </div>
          </ReactSpread>
        })
        ->React.array}
      </div>
    }}
    <ReactSpread
      props={select->Select.getToggleButtonPropsWithOptions(
        multiSelect->getDropdownProps(dropdownPropsOptions(~preventKeyAction=select.isOpen, ())),
      )}>
      <button
        type_="button"
        className="peer flex focus:bg-black hover:bg-black focus:text-white hover:text-white items-center justify-between border duration-300 w-full border-black rounded-md px-3 py-1 transition-all">
        <span className="leading-5 py-[6px]"> {"Options"->React.string} </span>
        <DownArrow className="ml-2 p-1 w-5 h-auto" />
      </button>
    </ReactSpread>
    <ReactSpread props={select->getMenuProps}>
      <ul
        className="bg-white transition-opacity opacity-0 absolute z-10 peer-aria-expanded:opacity-100 max-h-40 overflow-y-auto w-full top-full mt-1 shadow-md">
        {switch select.isOpen {
        | false => React.null
        | true => <>
            {items
            ->Array.mapWithIndex((index, item) => {
              let itemString = item->itemToString

              <ReactSpread
                props={select->getItemProps({item: item, index: index})}
                key={`${itemString}${index->string_of_int}`}>
                <li
                  key={`${itemString}${index->string_of_int}`}
                  className={`text-sm py-3 px-3 first:rounded-t border leading-4 aria-selected:text-white aria-selected:bg-black border-l-black border-r-black last:rounded-b hover:cursor-pointer hover:bg-black hover:text-white  transition-colors duration-500
    							`}>
                  {itemString->React.string}
                </li>
              </ReactSpread>
            })
            ->React.array}
          </>
        }}
      </ul>
    </ReactSpread>
  </div>
}
