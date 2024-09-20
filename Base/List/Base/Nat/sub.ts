import { Nat } from '../../Base/Nat/Type';

// Subtraction of natural numbers.
// - m: The minuend (number to subtract from).
// - n: The subtrahend (number to subtract).
// = The difference between m and n, or Zero if n > m.
export const $$sub = (m: Nat, n: Nat): Nat => {
  if (m === 0n) {
    return 0n;
  } else if (n === 0n) {
    return m;
  } else {
    var m_ = m - 1n;
    var n_ = n - 1n;
    return $sub(m_, n_);
  }
};

// NOTE: Native BigInt subtraction used for efficiency, with a check to ensure non-negative result.
export const $sub = (m: Nat, n: Nat): Nat => m >= n ? m - n : 0n;
export const  sub = (m: Nat) => (n: Nat) => $sub(m, n);