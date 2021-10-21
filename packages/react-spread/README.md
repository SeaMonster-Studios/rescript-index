# ReactSpread

Install

`yarn add @seamonster-studios/react-spread`

This is incredibly helpful when binding to javascript react components from w/in rescript that expect you to prop-spread. One example of this is Downshift.

```rescript
<ReactSpread props={select->getLabelProps}>
	<label className="mb-2"> {"Choose an option"->React.string} </label>
</ReactSpread >
```
