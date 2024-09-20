import { Nat, Zero, Succ } from '../../Base/Nat/Type';

// Doubles a nat.
// - n: The number to double.
// = The double of n.
export const $$double = (n: Nat): Nat => {
  if (n === 0n) {
    return Zero;
  } else {
    var pred = n - 1n;
    return Succ(Succ($$double(pred)));
  }
};

// NOTE: Using native BigInt multiplication for efficiency.
export const $double = (n: Nat): Nat => n * 2n;
export const double = (n: Nat) => $double(n);