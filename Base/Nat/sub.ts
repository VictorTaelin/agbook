import { Nat, Zero } from '../../Base/Nat/Type';

// Subtracts one nat from another.
// - m: The number to subtract from.
// - n: The number to subtract.
// = The result of m - n, or zero if n > m.
export const $$sub = (m: Nat, n: Nat): Nat => {
  if (n === 0n) {
    return m;
  } else if (m === 0n) {
    return 0n;
  } else {
    var m_ = m - 1n;
    var n_ = n - 1n;
    return $sub(m_, n_);
  }
};

// NOTE: Native BigInt subtraction used for efficiency.
export const $sub = (m: Nat, n: Nat): Nat => m >= n ? m - n : 0n;
export const  sub = (m: Nat) => (n: Nat) => m >= n ? m - n : 0n;

// NOTE: Operator omitted: '_-_'.