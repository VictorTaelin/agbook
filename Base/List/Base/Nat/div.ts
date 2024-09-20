import { Nat } from '../../Base/Nat/Type';

// Division of nats.
// - m: The dividend.
// - n: The divisor.
// = The quotient of m divided by n.
export const $$div = (m: Nat, n: Nat): Nat => {
  if (n === 0n) {
    throw new Error("Division by zero");
  }
  if (m < n) {
    return 0n;
  } else {
    return 1n + $$div(m - n, n);
  }
};

// NOTE: Using native BigInt division for efficiency.
export const $div = (m: Nat, n: Nat): Nat => m / n;
export const  div = (m: Nat) => (n: Nat) => m / n;