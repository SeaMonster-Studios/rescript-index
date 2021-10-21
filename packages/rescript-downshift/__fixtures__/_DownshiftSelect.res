open Belt
open Downshift

module Select = Select.Make({
  type item = string
})

open Select

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

let default = () => {
  let items = ["Option 1", "Option 2", "Option 3", "Option 5", "Option 6"]
  let select = use(options(~items, ()))

  <div className="flex flex-col items-start m-8">
    <ReactSpread props={select->getLabelProps}>
      <label className="mb-2"> {"Choose an option"->React.string} </label>
    </ReactSpread>
    <ReactSpread props={select->getToggleButtonProps}>
      <button
        type_="button"
        className="flex focus:bg-black hover:bg-black focus:text-white hover:text-white items-center justify-between border duration-300 w-full   border-black rounded-md px-3 py-2 transition-all">
        <span>
          {switch select.selectedItem->Js.Nullable.toOption {
          | None => "Options"
          | Some(selectedItem) => selectedItem
          }->React.string}
        </span>
        <DownArrow className="ml-2 p-1 w-5 h-auto" />
      </button>
    </ReactSpread>
    <ReactSpread props={select->getMenuProps}>
      <ul
        className="bg-white transition-opacity opacity-0 aria-expanded:opacity-100 max-h-40 overflow-y-scroll w-full mt-1 shadow-md">
        {switch select.isOpen {
        | false => React.null
        | true => <>
            {items
            ->Array.mapWithIndex((index, item) => {
              <ReactSpread
                key={`${item}${index->string_of_int}`}
                props={select->getItemProps(itemPropsOptions(~index, ()))}>
                <li
                  className={`text-sm py-2 px-3 first:rounded-t border border-l-black border-r-black last:rounded-b hover:cursor-pointer hover:bg-black hover:text-white aria-selected:text-white aria-selected:bg-black transition-colors duration-500 ${select.selectedItem
                    ->Js.Nullable.toOption
                    ->Option.getWithDefault("") == item
                      ? "bg-black text-white bg-opacity-60"
                      : ""}`}>
                  {item->React.string}
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
