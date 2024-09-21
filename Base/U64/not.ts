import { U64 } from '../../Base/U64/Type';
import { Bits } from '../../Base/Bits/Type';
import { $to_nat } from '../../Base/Bits/to-nat';
import { $not as $not_bits } from '../../Base/Bits/not';
import { $to_bits } from '../../Base/U64/to-bits';
import { $from_nat } from '../../Base/U64/from-nat';

// Performs bitwise NOT operation on a U64 value.
// - x: The U64 value to be negated.
// = The result of bitwise NOT on x.
export const $not = (x: U64): U64 => {
  return $from_nat($to_nat($not_bits($to_bits(x))));
};

export const not = (x: U64) => $not(x);

// NOTE: Infix operator '~_' is not directly translatable to TypeScript.
// Users can use the 'not' function instead.
