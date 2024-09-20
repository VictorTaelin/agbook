import { Nat, Zero } from '../../Base/Nat/Type';

// Helper function div-helper for Euclidean division.
const $$div_helper = (k: Nat, m: Nat, n: Nat, j: Nat): Nat => {
  if (n === 0n) {
    return k;
  } else {
    var n_ = n - 1n;
    if (j === 0n) {
      return $$div_helper(k + 1n, m, n_, m);
    } else {
      var j_ = j - 1n;
      return $$div_helper(k, m, n_, j_);
    }
  }
};

// Integer division of nats.
// - m: The dividend.
// - n: The divisor (must be non-zero).
// = The quotient of m divided by n.
export const $$div = (m: Nat, n: Nat): Nat => {
  if (n === 0n) {
    return 0n;  // Division by zero returns zero.
  } else {
    var n_ = n - 1n;
    return $$div_helper(0n, n_, m, n_);
  }
};

// NOTE: Using native BigInt division for efficiency, with a check for division by zero.
export const $div = (m: Nat, n: Nat): Nat => n === 0n ? 0n : m / n;
export const  div = (m: Nat) => (n: Nat) => $div(m, n);
