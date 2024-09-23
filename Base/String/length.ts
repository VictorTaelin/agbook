import { String } from '../../Base/String/Type';
import { Nat } from '../../Base/Nat/Type';
import { $to_list } from '../../Base/String/to-list';
import { $length as length_list } from '../../Base/List/length';

// Computes the length of a string.
// - s: The input string.
// = The number of characters in the string.
export const $$length = (s: String): Nat => {
  return length_list($to_list(s));
};

// NOTE: Using native string length for efficiency.
export const $length = (s: String): Nat => BigInt(s.length);
export const  length = (s: String) => $length(s);