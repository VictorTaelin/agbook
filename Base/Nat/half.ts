import { Nat, Zero, Succ } from '../../Base/Nat/Type';

// Calculates half of a natural number.
// - n: The number to halve.
// = The largest natural number not exceeding n/2.
export const $$half = (n: Nat): Nat => {
  if (n === 0n) {
    return 0n;
  } else if (n === 1n) {
    return 0n;
  } else {
    var n_ = n - 2n;
    return 1n + $half(n_);
  }
};

// NOTE: Using native BigInt division for efficiency.
export const $half = (n: Nat): Nat => n / 2n;
export const  half = (n: Nat) => n / 2n;