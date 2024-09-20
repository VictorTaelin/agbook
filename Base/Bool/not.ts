import { Bool } from '../../Base/Bool/Type';

// Negates a Boolean value.
// - b: The input Boolean value.
// = The negation of the input.
export const $$not = (b: Bool): Bool => {
  if (b) {
    return false;
  } else {
    return true;
  }
};

// NOTE: Using native boolean NOT for efficiency.
export const $not = (b: Bool): Bool => !b;
export const  not = (b: Bool) => !b;

// NOTE: Operator omitted: '!_'.
