import { Nat } from '../../Base/Nat/Type';
import { $mul } from '../../Base/Nat/mul';

// Exponentiation of nats.
// - m: The 1st nat.
// - n: The 2nd nat.
// = m to the power of n.
export const $$exp = (m: Nat, n: Nat): Nat => {
  if (n === 0n) {
    return 1n;
  } else {
    var pred = n - 1n;
    return $mul(m, $$exp(m, pred));
  }
};

// NOTE: Using native BigInt exponentiation for efficiency.
export const $exp = (m: Nat, n: Nat): Nat => m ** n;
export const  exp = (m: Nat) => (n: Nat) => m ** n;

// NOTE: Operator '_**_' omitted.
