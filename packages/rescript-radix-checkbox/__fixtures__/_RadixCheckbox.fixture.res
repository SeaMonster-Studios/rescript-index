let default = () => {
  let (checked, setChecked) = React.useState(() => false)

  <div>
    <RadixCheckbox.Root
      id="the-checkbox"
      checked={checked}
      onCheckedChange={checked => {
        setChecked(_ => checked)
      }}>
      <span className="flex w-4 h-4 border border-solid border-black">
        <RadixCheckbox.Indicator className="inline-block w-full h-full bg-black" />
      </span>
    </RadixCheckbox.Root>
    <label htmlFor="the-checkbox"> {React.string("Click me")} </label>
  </div>
}
