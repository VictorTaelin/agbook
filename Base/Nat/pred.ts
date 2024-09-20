import { Nat, Zero } from '../../Base/Nat/Type';

// Returns the predecessor of a natural number.
// - n: The input natural number.
// = The predecessor of n, or Zero if n is already Zero.
export const $$pred = (n: Nat): Nat => {
  if (n === 0n) {
    return Zero;
  } else {
    return n - 1n;
  }
};

// NOTE: Using native BigInt subtraction for efficiency.
export const $pred = (n: Nat): Nat => n === 0n ? 0n : n - 1n;
export const  pred = (n: Nat) => $pred(n);
