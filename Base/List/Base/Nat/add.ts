import { Nat } from '../../Base/Nat/Type';

// Addition of nats.
// - m: The 1st nat.
// - n: The 2nd nat.
// = The sum of m and n.
export const $$add = (m: Nat, n: Nat): Nat => {
  if (m === 0n) {
    return n;
  } else {
    var pred = m - 1n;
    return 1n + $$add(pred, n);
  }
};

// NOTE: Using native BigInt addition for efficiency.
export const $add = (m: Nat, n: Nat): Nat => m + n;
export const  add = (m: Nat) => (n: Nat) => m + n;

// NOTE: Operator omitted: '_+_'.