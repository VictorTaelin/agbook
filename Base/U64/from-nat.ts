import { Nat } from '../../Base/Nat/Type';
import { U64 } from '../../Base/U64/Type';

// Converts a Nat to a U64.
export const $from_nat = (n: Nat): U64 => {
  // Ensure the value is within the U64 range (0 to 2^64 - 1)
  return BigInt.asUintN(64, n);
};

export const from_nat = (n: Nat) => $from_nat(n);

// NOTE: Using BigInt.asUintN to ensure the result is within the 64-bit unsigned integer range.