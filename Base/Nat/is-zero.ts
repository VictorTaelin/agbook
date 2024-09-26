import { Nat } from '../../Base/Nat/Nat';
import { Bool, $True, $False } from '../../Base/Bool/Bool';

// Checks if a natural number is zero.
// - n: The natural number to check.
// = True if n is zero, False otherwise.
export const $is_zero = (n: Nat): Bool => {
  if (n === 0n) {
    return $True;
  } else {
    return $False;
  }
};

export const is_zero = (n: Nat) => $is_zero(n);

// NOTE: Using native BigInt comparison for efficiency.
