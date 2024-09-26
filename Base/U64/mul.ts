import { U64 } from '../../Base/U64/U64';
import { $to_nat } from '../../Base/U64/to-nat';
import { $from_nat } from '../../Base/U64/from-nat';

// Multiplies two U64 values.
// - a: The first U64 to multiply.
// - b: The second U64 to multiply.
// = The result of a * b, potentially wrapping around due to 64-bit limitation.
export const $$mul = (a: U64, b: U64): U64 => {
  return $from_nat($to_nat(a) * $to_nat(b));
};

// NOTE: Using native BigInt multiplication for efficiency, then ensuring the result is within U64 range.
export const $mul = (a: U64, b: U64): U64 => BigInt.asUintN(64, a * b);
export const  mul = (a: U64) => (b: U64) => $mul(a, b);

// NOTE: Operator '_*_' omitted.
