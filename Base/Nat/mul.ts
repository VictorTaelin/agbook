import { Nat } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';

// Multiplication of nats.
// - m: The 1st nat.
// - n: The 2nd nat.
// = The product of m and n.
export const $$mul = (m: Nat, n: Nat): Nat => {
  if (m === 0n) {
    return 0n;
  } else {
    var pred = m - 1n;
    return $add(n, $$mul(pred, n));
  }
};

// NOTE: Using native BigInt multiplication for efficiency.
export const $mul = (m: Nat, n: Nat): Nat => m * n;
export const  mul = (m: Nat) => (n: Nat) => m * n;

// NOTE: Operator '_*_' omitted.