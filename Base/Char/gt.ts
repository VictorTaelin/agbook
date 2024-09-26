import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';
import { $to_nat } from '../../Base/Char/to-nat';
import { $gt as Nat$gt } from '../../Base/Nat/gt';

// Compares two characters.
// - x: The first character.
// - y: The second character.
// = True if x is greater than y, False otherwise.
export const $gt = (x: Char, y: Char): Bool => Nat$gt($to_nat(x), $to_nat(y));
export const  gt = (x: Char) => (y: Char) => $gt(x, y);

// NOTE: Operator omitted: '_>_'
