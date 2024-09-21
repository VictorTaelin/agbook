import { U64 } from '../../Base/U64/Type';
import { $to_nat } from '../../Base/U64/to-nat';
import { $from_nat } from '../../Base/U64/from-nat';

// Addition of two U64 numbers.
// - a: The first U64 number.
// - b: The second U64 number.
// = The sum of a and b as a U64 number.
export const $$add = (a: U64, b: U64): U64 => {
  return $from_nat($to_nat(a) + $to_nat(b));
};

// NOTE: Using native BigInt addition for efficiency.
export const $add = (a: U64, b: U64): U64 => {
  return BigInt.asUintN(64, a + b);
};

export const add = (a: U64) => (b: U64) => $add(a, b);

// NOTE: Infix operator '_+_' omitted.
