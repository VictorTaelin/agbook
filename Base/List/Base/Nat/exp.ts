import { Nat } from '../../Base/Nat/Type';

// Exponentiation of nats.
// - base: The base number.
// - exp: The exponent.
// = The result of base raised to the power of exp.
export const $$exp = (base: Nat, exp: Nat): Nat => {
  if (exp === 0n) {
    return 1n;
  } else {
    return base * $$exp(base, exp - 1n);
  }
};

// NOTE: Using native BigInt exponentiation for efficiency.
export const $exp = (base: Nat, exp: Nat): Nat => base ** exp;
export const  exp = (base: Nat) => (exp: Nat) => base ** exp;