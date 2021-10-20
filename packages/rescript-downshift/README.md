# Downshift ReScript Bindings

Install

`yarn add @seamonster-studios/rescript-downshift`

## use-select with ReForm example

```rescript

/* Hooks.res ------------------------------------------------- */

@module("react")
external useMemo10: (@uncurry (unit => 'any), ('a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j)) => 'any =
  "useMemo"

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
