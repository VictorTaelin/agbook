import { Nat, Zero } from '../../Base/Nat/Nat';

// Calculates half of a natural number.
// - n: The number to halve.
// = The largest natural number not exceeding n/2.
export const $$half = (n: Nat): Nat => {
  if (n === 0n) {
    return Zero;
  } else if (n === 1n) {
    return Zero;
  } else {
    var n_ = n - 2n;
    return 1n + $half(n_);
  }
};

// NOTE: Using native BigInt division for efficiency.
export const $half = (n: Nat): Nat => n / 2n;
export const  half = (n: Nat) => $half(n);
