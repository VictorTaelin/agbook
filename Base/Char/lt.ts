import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';
import { $to_nat } from '../../Base/Char/to-nat';
import { $lt as nat_lt } from '../../Base/Nat/lt';

// Compares two characters lexicographically.
// - x: The first character.
// - y: The second character.
// = True if x is lexicographically less than y, False otherwise.
export const $lt = (x: Char, y: Char): Bool => nat_lt($to_nat(x), $to_nat(y));
export const  lt = (x: Char) => (y: Char) => $lt(x, y);

// NOTE: Operator omitted: '_<_'

// NOTE: Using the to_nat function and then comparing the resulting numbers
// for efficiency and to match the Agda implementation.