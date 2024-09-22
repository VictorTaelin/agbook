import { U64 } from '../../Base/U64/Type';
import { $add } from '../../Base/U64/add';

// Doubles a given U64 number
// Input: x (U64)
// Output: The result of x + x (U64)
export const $$double = (x: U64): U64 => {
  return $add(x, x);
};

// NOTE: Using native BigInt multiplication for efficiency.
export const $double = (x: U64): U64 => {
  return BigInt.asUintN(64, x * 2n);
};

export const double = (x: U64) => $double(x);