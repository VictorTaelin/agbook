import { Nat } from '../../Base/Nat/Type';
import { U64 } from '../../Base/U64/Type';

// Converts a natural number to a 64-bit unsigned integer.
// - n: The natural number to convert.
// = The corresponding U64 value, or throws an error if out of range.
export const $to_u64 = (n: Nat): U64 => {
  if (n < 0n || n > 0xFFFFFFFFFFFFFFFFn) {
    throw new Error('Number out of U64 range');
  }
  return n;
};

export const to_u64 = (n: Nat) => $to_u64(n);

// NOTE: Both Nat and U64 are represented as BigInt,
// so we just need to check if the number is within the U64 range.