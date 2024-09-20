import { Nat } from '../../Base/Nat/Type';
import { $sub } from '../../Base/Nat/sub';

// Helper function for modulo operation
// - k: Accumulator for the remainder
// - m: The divisor
// - n: The remaining dividend
// - j: Counter for the divisor
// = The remainder of the division
export const $mod_aux = (k: Nat, m: Nat, n: Nat, j: Nat): Nat => {
  if (n === 0n) {
    return k;
  } else if (j === 0n) {
    return $mod_aux(0n, m, n - 1n, m);
  } else {
    return $mod_aux(k + 1n, m, n - 1n, j - 1n);
  }
};

export const mod_aux = (k: Nat) => (m: Nat) => (n: Nat) => (j: Nat) => $mod_aux(k, m, n, j);

// Performs natural number modulo operation
// - n: The dividend
// - m: The divisor
// = The remainder of n divided by m
export const $mod = (n: Nat, m: Nat): Nat => {
  if (m === 0n) {
    return 0n; // Modulo by zero returns zero
  } else {
    return $mod_aux(0n, m - 1n, n, m - 1n);
  }
};

export const mod = (n: Nat) => (m: Nat) => $mod(n, m);

// NOTE: Native BigInt modulo used for efficiency.
export const $$mod = (n: Nat, m: Nat): Nat => m === 0n ? 0n : n % m;

// NOTE: Operator omitted: '_%_'.