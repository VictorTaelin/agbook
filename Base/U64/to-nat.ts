import { U64 } from '../../Base/U64/U64';
import { Nat } from '../../Base/Nat/Nat';

// Converts a U64 to a Nat.
export const $to_nat = (x: U64): Nat => {
  // Ensure the result is non-negative and within the 64-bit unsigned range
  return BigInt.asUintN(64, x);
};

export const to_nat = (x: U64) => $to_nat(x);

// NOTE: Both U64 and Nat are represented as BigInt in TypeScript,
// but we use BigInt.asUintN to ensure the value stays within the 64-bit unsigned range.
