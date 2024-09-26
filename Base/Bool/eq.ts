import { Bool } from '../../Base/Bool/Bool';

// Checks if two boolean values are equal.
// - x: The first boolean value.
// - y: The second boolean value.
// = True if x and y are equal, False otherwise.
export const $$eq = (x: Bool, y: Bool): Bool => {
  if (x) {
    if (y) {
      return true;
    } else {
      return false;
    }
  } else {
    if (y) {
      return false;
    } else {
      return true;
    }
  }
};

// NOTE: Using native boolean equality for efficiency.
export const $eq = (x: Bool, y: Bool): Bool => x === y;
export const  eq = (x: Bool) => (y: Bool) => x === y;

// NOTE: Operator omitted: '_==_'.
