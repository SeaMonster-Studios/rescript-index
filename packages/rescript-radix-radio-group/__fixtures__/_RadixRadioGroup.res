open RadixRadioGroup

let default = () => {
  let (value, setValue) = React.useState(() => "default")
  <>
    <form>
      <RadioGroup
        id="radix-radio-group"
        value
        \"aria-label"="View density"
        onValueChange={value => setValue(_ => value)}>
        <div className="radio-group-item-container">
          <RadioGroupItem value="default" id="r1" className="radio-group-item">
            <RadioGroupIndicator className="radio-group-indicator" />
          </RadioGroupItem>
          <label htmlFor="r1"> {"Default"->React.string} </label>
        </div>
        <div className="radio-group-item-container">
          <RadioGroupItem value="comfortable" id="r2" className="radio-group-item">
            <RadioGroupIndicator className="radio-group-indicator" />
          </RadioGroupItem>
          <label htmlFor="r2"> {"Comfortable"->React.string} </label>
        </div>
        <div className="radio-group-item-container">
          <RadioGroupItem value="compact" id="r3" className="radio-group-item">
            <RadioGroupIndicator className="radio-group-indicator" />
          </RadioGroupItem>
          <label htmlFor="r3"> {"Compact"->React.string} </label>
        </div>
      </RadioGroup>
    </form>
    {`${value} selected`->React.string}
  </>
}
