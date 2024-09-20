import { Ordering, LT, EQ, GT } from '../../Base/Ordering/Type';
import { Nat } from '../../Base/Nat/Type';

// Compares two natural numbers.
// - m: The first natural number.
// - n: The second natural number.
// = LT if m < n, EQ if m = n, GT if m > n.
export const $$compare = (m: Nat, n: Nat): Ordering => {
  if (m === 0n) {
    if (n === 0n) {
      return EQ;
    } else {
      return LT;
    }
  } else {
    if (n === 0n) {
      return GT;
    } else {
      var m_ = m - 1n;
      var n_ = n - 1n;
      return $compare(m_, n_);
    }
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $compare = (m: Nat, n: Nat): Ordering => {
  if (m < n) return LT;
  if (m > n) return GT;
  return EQ;
};

export const compare = (m: Nat) => (n: Nat) => $compare(m, n);
