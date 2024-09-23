import { U64 } from '../../Base/U64/Type';
import { $to_bits } from '../../Base/U64/to-bits';
import { $and as $andB } from '../../Base/Bits/and';
import { $to_nat } from '../../Base/Bits/to-nat';
import { $from_nat } from '../../Base/U64/from-nat';

// Bitwise AND operation on two U64 numbers.
// - a: The first U64 number.
// - b: The second U64 number.
// = The result of bitwise AND between a and b as a U64 number.
export const $$and = (a: U64, b: U64): U64 => {
  return $from_nat($to_nat($andB($to_bits(a), $to_bits(b))));
};

// NOTE: Using native BigInt bitwise AND for efficiency.
export const $and = (a: U64, b: U64): U64 => {
  return BigInt.asUintN(64, a & b);
};

export const and = (a: U64) => (b: U64) => $and(a, b);

// NOTE: Operator omitted: '_&&_'.