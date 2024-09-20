import { Bool } from '../../Base/Bool/Type';

// Performs logical AND operation on two boolean values.
// - a: The first boolean value.
// - b: The second boolean value.
// = True if both a and b are true.
export const $$and = (a: Bool, b: Bool): Bool => {
  if (a) {
    return b;
  } else {
    return false;
  }
};

// NOTE: Using native boolean AND for efficiency.
export const $and = (a: Bool, b: Bool): Bool => a && b;
export const  and = (a: Bool) => (b: Bool): Bool => a && b;

// NOTE: Operator omitted: '_&&_'.
