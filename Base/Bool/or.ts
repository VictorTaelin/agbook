import { Bool } from '../../Base/Bool/Type';

// Performs logical OR operation on two bools.
// - a: The 1st bool.
// - b: The 2nd bool.
// = True if either a or b is true.
export const $$or = (a: Bool, b: Bool): Bool => {
  if (a) {
    return true;
  } else {
    return b;
  }
};

// NOTE: using native boolean OR for efficiency.
export const $or = (a: Bool, b: Bool): Bool => a || b;
export const  or = (a: Bool) => (b: Bool) => a || b;

// NOTE: operator '_||_' omitted.