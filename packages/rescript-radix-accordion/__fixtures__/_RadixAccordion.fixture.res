let default = () => {
  let (value, setValue) = React.useState(() => None)

  <div className="Fixture__RadixAccordion">
    <RadixAccordion
      \"type"=#single collapsible=true ?value className="Fixture__RadixAccordion__Root">
      <RadixAccordion.Item value="item-1" className="Fixture__RadixAccordion__Item">
        <RadixAccordion.Trigger className="Fixture__RadixAccordion__Trigger">
          {"Open Item 1"->React.string}
        </RadixAccordion.Trigger>
        <RadixAccordion.Content className="Fixture__RadixAccordion__Content">
          <div> {"Item 1"->React.string} </div>
        </RadixAccordion.Content>
      </RadixAccordion.Item>
      <RadixAccordion.Item value="item-2" className="Fixture__RadixAccordion__Item">
        <RadixAccordion.Trigger className="Fixture__RadixAccordion__Trigger">
          {"Open Item 2"->React.string}
        </RadixAccordion.Trigger>
        <RadixAccordion.Content className="Fixture__RadixAccordion__Content">
          <div> {"Item 2"->React.string} </div>
        </RadixAccordion.Content>
      </RadixAccordion.Item>
    </RadixAccordion>
    <div className="mt-10">
      <button
        className="bg-gray-200 px-4 py-2 rounded-md border border-gray-300"
        type_="button"
        onClick={_ => setValue(prevValue => prevValue->Js.Option.isNone ? Some("item-1") : None)}>
        {"Toggle Item 1"->React.string}
      </button>
    </div>
  </div>
}
