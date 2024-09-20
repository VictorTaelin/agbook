import { Nat } from '../../Base/Nat/Type';
import { $sub } from '../../Base/Nat/sub';
import { $lt } from '../../Base/Nat/lt';
import { $if_then_else_ } from '../../Base/Bool/if';

// Helper function div-helper for Euclidean division.
const $div_helper = (k: Nat, m: Nat, n: Nat, j: Nat): Nat => {
  if (n === 0n) {
    return k;
  } else if (j === 0n) {
    return $div_helper(k + 1n, m, n - 1n, m);
  } else {
    return $div_helper(k, m, n - 1n, j - 1n);
  }
};

export const div_helper = (k: Nat) => (m: Nat) => (n: Nat) => (j: Nat) => $div_helper(k, m, n, j);

// Integer division of nats.
// - m: The dividend.
// - n: The divisor (must be non-zero).
// = The quotient of m divided by n.
export const $$div = (m: Nat, n: Nat): Nat => {
  if (n === 0n) {
    return 0n;  // Division by zero returns zero.
  } else {
    var n_ = n - 1n;
    return $div_helper(0n, n_, m, n_);
  }
};

// NOTE: Using native BigInt division for efficiency, with a check for division by zero.
export const $div = (m: Nat, n: Nat): Nat => n === 0n ? 0n : m / n;
export const  div = (m: Nat) => (n: Nat) => $div(m, n);