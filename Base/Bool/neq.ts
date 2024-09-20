import { Bool } from '../../Base/Bool/Type';

// Checks if two boolean values are not equal.
// - a: The first boolean value.
// - b: The second boolean value.
// = True if a and b are different, False otherwise.
export const $$neq = (a: Bool, b: Bool): Bool => {
  if (a) {
    if (b) {
      return false;
    } else {
      return true;
    }
  } else {
    if (b) {
      return true;
    } else {
      return false;
    }
  }
};

// NOTE: Using native boolean inequality for efficiency.
export const $neq = (a: Bool, b: Bool): Bool => a !== b;
export const  neq = (a: Bool) => (b: Bool) => a !== b;

// NOTE: Operator omitted: '_!=_'.
