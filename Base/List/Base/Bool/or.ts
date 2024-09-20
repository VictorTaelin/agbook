import { Bool } from '../../Base/Bool/Type';

// Performs logical OR operation on two boolean values.
// - a: The first boolean value.
// - b: The second boolean value.
// = True if either a or b is true.
export const $$or = (a: Bool, b: Bool): Bool => {
  if (a) {
    return true;
  } else {
    return b;
  }
};

// NOTE: Using native boolean OR for efficiency.
export const $or = (a: Bool, b: Bool): Bool => a || b;
export const  or = (a: Bool) => (b: Bool) => a || b;

// NOTE: Operator omitted: '_||_'.