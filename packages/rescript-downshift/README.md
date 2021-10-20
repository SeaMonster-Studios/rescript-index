# Downshift ReScript Bindings

Install

`yarn add @seamonster-studios/rescript-downshift`

## use-select with ReForm and TailwindCSS example

```rescript

/* Hooks.res ------------------------------------------------- */

@module("react")
external useMemo10: (@uncurry (unit => 'any), ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j)) => 'any =
  "useMemo"

/* FieldSelect.res ------------------------------------------------- */

open Belt
open Downshift

@react.component
let make = (
  ~items,
  ~disabled,
  ~className="",
  ~label,
  ~placeholder="Options",
  ~error: React.element,
  ~labelProps,
  ~toggleButtonProps,
  ~menuProps,
  ~selectedItem,
  ~itemToString: Js.Nullable.t<'a> => string,
  ~getItemProps,
  ~isOpen,
) => {
  let value = itemToString(selectedItem)
  <div className={`flex flex-col items-start ${className} relative`}>
    <Spread props={labelProps}> {label} </Spread>
    <Spread props={toggleButtonProps}>
      <button
        disabled
        type_="button"
        className="flex focus:bg-black hover:bg-black focus:text-white hover:text-white items-center justify-between border duration-300 w-full border-black rounded-md px-3 py-2 transition-all">
        <span>
          {switch selectedItem->Js.Nullable.toOption {
          | None => placeholder
          | Some(_) => value
          }->React.string}
        </span>
        <Icons.DownArrow className="ml-2 p-1 w-5 h-auto" />
      </button>
    </Spread>
    <Spread props={menuProps}>
      <ul
        className="bg-white transition-opacity opacity-0 absolute z-10 aria-expanded:opacity-100 max-h-40 overflow-y-auto w-full top-full mt-1 shadow-md">
        {switch isOpen {
        | false => React.null
        | true => <>
            {items
            ->Array.mapWithIndex((index, item) => {
              let itemString = item->Js.Nullable.return->itemToString
              <Spread key={`${value}${index->string_of_int}`} props={getItemProps(index)}>
                <li
                  className={`text-sm py-2 px-3 first:rounded-t border border-l-black border-r-black last:rounded-b hover:cursor-pointer hover:bg-black hover:text-white  transition-colors duration-500
									${switch selectedItem->Js.Nullable.toOption {
                    | None => ""
                    | Some(_) =>
                      switch value == itemString {
                      | false => ""
                      | true => " bg-black text-white bg-opacity-60 "
                      }
                    }}`}>
                  {itemString->React.string}
                </li>
              </Spread>
            })
            ->React.array}
          </>
        }}
      </ul>
    </Spread>
    error
  </div>
}


/* FormMaker.res ------------------------------------------------- */

open ReForm
open Belt

module Make = (Config: ReForm.Config) => {
  include ReForm.Make(Config)

  module Label = {
    let className = "mb-2 uppercase"

    @react.component
    let make = (~label: option<string>=?, ~htmlFor: option<string>=?, ~className=className) =>
      label->Option.mapWithDefault(React.null, label =>
        <label className ?htmlFor> {React.string(label)} </label>
      )
  }

  module Success = {
    let className = "bg-green text-white px-4 py-2 rounded w-full block"

    @react.component
    let make = (~children, ~className as cn="") =>
      <div className={`${className} ${cn}`}> children </div>
  }

  module Error = {
    let className = "bg-red text-white px-4 py-2 rounded mt-1 w-full block"

    @react.component
    let make = (~fieldInterface: fieldInterface<'a>, ~className as cn="") =>
      fieldInterface.error->Option.mapWithDefault(React.null, error =>
        <div className={`${cn} ${className}`}> {error->str} </div>
      )
  }

  module type MakeSelectConfig = {
    type item
    let itemToString: Js.Nullable.t<item> => string
  }

  module MakeSelect = (FieldConfig: MakeSelectConfig) => {
    module UseSelect = Downshift.Select.Make({
      type item = FieldConfig.item
    })

    open! UseSelect

    @react.component
    let make = (
      ~field: Config.field<'a>,
      ~renderOnMissingContext=React.null,
      ~disabled,
      ~label,
      ~placeholder=?,
      ~className=?,
      ~items,
    ) => {
      let fieldInterface = useField(field)
      let select = use(
        options(
          ~items,
          ~selectedItem=fieldInterface->Option.mapWithDefault(Js.Nullable.null, fieldInterface =>
            fieldInterface.value
          ),
          ~onSelectedItemChange={
            changes => {
              switch fieldInterface {
              | None => ()
              | Some(fieldInterface) =>
                fieldInterface.validate()
                changes["selectedItem"]->fieldInterface.handleChange
              }
            }
          },
          (),
        ),
      )

      Hooks.useMemo10(
        () =>
          fieldInterface
          ->Option.map(fieldInterface =>
            <FieldSelect
              disabled
              label={<Label label />}
              selectedItem=fieldInterface.value
              items
              itemToString={FieldConfig.itemToString}
              menuProps={select->getMenuProps}
              labelProps={select->getLabelProps}
              toggleButtonProps={select->getToggleButtonProps}
              isOpen=select.isOpen
              error={<Error fieldInterface />}
              getItemProps={index => select->getItemProps(itemPropsOptions(~index, ()))}
              ?placeholder
              ?className
            />
          )
          ->Option.getWithDefault(renderOnMissingContext),
        (
          className,
          disabled,
          items,
          label,
          placeholder,
          renderOnMissingContext,
          select.isOpen,
          fieldInterface->Option.map(({error}) => error),
          fieldInterface->Option.map(({value}) => value),
          fieldInterface->Option.map(({state}) => state),
        ),
      )
    }
  }
}

/* MyForm.res ------------------------------------------------- */

open Belt

module Form = {
  module Lenses = %lenses(
    type state = {
      color: Js.Nullable.t<string>,
    }
  )

  module Form = FormMaker.Make(Lenses)

  include Form

  let schema = Form.Validation.Schema([
    Custom({
      field: Color,
      meta: (),
      predicate: values => values.color == Js.Nullable.null ? Error("Color is required") : Valid,
    }),
  ])
}

module StringSelect = Form.MakeSelect({
  type item = string
  let itemToString = nullalbeItem => nullalbeItem->Js.Nullable.toOption->Option.getWithDefault("")
})

@react.component
let make = () => {
  let (showSuccess, setShowSuccess) = React.useState(() => false)

  let form = Form.use(
    ~validationStrategy=OnDemand,
    ~schema=Form.schema,
    ~initialState={color: Js.Nullable.null},
    ~onSubmit=({state: _state, send: _send}) => {
      setShowSuccess(_ => true)

      None
    },
    (),
  )

 	<Form.Provider value=form>
		<form
			onSubmit={event => {
				ReactEvent.Synthetic.preventDefault(event)
				form.submit()
			}}>
			<div className="mb-4">
				<StringSelect
					field=Form.Lenses.Color
					disabled=false
					label="Your Favorite Color"
					items=["Red", "Green", "Blue"]
				/>
			</div>
			<div className="mt-6">
				<Button
					action=#onClick(
						_ => {
							setShowSuccess(_ => false)
							form.submit()
						},
					)>
					{"Submit"->str}
				</Button>
			</div>
			{switch showSuccess {
			| true =>
				<Form.Success className="mt-6">
					{"Success! May the force be with you. Always."->str}
				</Form.Success>
			| false => React.null
			}}
		</form>
	</Form.Provider>
}



```

Tailwind Config Additions

```js
const plugin = require("tailwindcss/plugin");

module.exports = {
  plugins: [
    plugin(function ({ addVariant, e }) {
      addVariant("aria-expanded", ({ modifySelectors, separator }) => {
        modifySelectors(({ className }) => {
          return `[aria-expanded="true"] ~ .${e(
            `aria-expanded${separator}${className}`
          )}`;
        });
      });
    }),
  ],
  variants: {
    extend: {
      opacity: ["aria-expanded"],
      cursor: ["hover"],
      borderRadius: ["first", "last"],
    },
  },
};
```
