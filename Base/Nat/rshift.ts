import { Nat } from '../../Base/Nat/Nat';
import { $div } from '../../Base/Nat/div';
import { $exp } from '../../Base/Nat/exp';

// Performs right shift operation on a natural number.
// - n: The input natural number.
// - shift: The number of positions to shift right.
// = A new natural number representing the right-shifted result.
export const $$rshift = (n: Nat, shift: Nat): Nat => {
  return $div(n, $exp(2n, shift));
};

// NOTE: Using native BigInt right shift for efficiency.
export const $rshift = (n: Nat, shift: Nat): Nat => n >> shift;
export const  rshift = (n: Nat) => (shift: Nat) => n >> shift;

// NOTE: Operator '_>>_' omitted.