import { useNumberFieldState } from 'react-stately';
import { useLocale, useNumberField } from 'react-aria';

function useCustomNumberField(props) {
  let { locale } = useLocale();
  let state = useNumberFieldState({ ...props, locale });
  let inputRef = props.inputRef;

  let {
    labelProps,
    groupProps,
    inputProps,
    incrementButtonProps,
    decrementButtonProps
  } = useNumberField(props, state, inputRef);

  { inputProps, labelProps, incrementButtonProps, decrementButtonProps, groupProps }
}

