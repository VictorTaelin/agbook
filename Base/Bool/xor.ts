import { Bool } from '../../Base/Bool/Type';

// Performs logical XOR operation on two bools.
// - a: The 1st bool.
// - b: The 2nd bool.
// = True if a and b are different.
export const $$xor = (a: Bool, b: Bool): Bool => {
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

// NOTE: using native boolean XOR for efficiency.
export const $xor = (a: Bool, b: Bool): Bool => a !== b;
export const  xor = (a: Bool) => (b: Bool) => a !== b;

// NOTE: operator omitted: '_^_'.