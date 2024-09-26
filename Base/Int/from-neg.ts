import { Int, $Pos, $NegSuc } from '../../Base/Int/Int';
import { Nat, $Zero } from '../../Base/Nat/Nat';

// Converts a negative natural number to an integer.
// - n: The natural number to convert.
// = The corresponding negative integer representation.
//   Note: Zero is treated as a positive number (Pos Zero).
export const $$from_neg = (n: Nat): Int => {
  if (n === 0n) {
    return $Pos($Zero);
  } else {
    var pred = n - 1n;
    return $NegSuc(pred);
  }
};

// NOTE: Using native BigInt operations for efficiency.
export const $from_neg = (n: Nat): Int => n === 0n ? 0n : -n;
export const  from_neg = (n: Nat): Int => $from_neg(n);
