import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';
import { $to_nat } from '../../Base/Char/to-nat';
import { $lte as nat_lte } from '../../Base/Nat/lte';

// Compares two characters lexicographically.
// - x: The first character.
// - y: The second character.
// = true if x is less than or equal to y, false otherwise.
export const $$lte = (x: Char, y: Char): Bool => {
  return nat_lte($to_nat(x), $to_nat(y));
};

// NOTE: Using native string comparison for efficiency
export const $lte = (x: Char, y: Char): Bool => x <= y;
export const  lte = (x: Char) => (y: Char) => x <= y;

// NOTE: Operator omitted: '_<=_'