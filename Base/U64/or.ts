import { U64 } from '../../Base/U64/U64';
import { Bits } from '../../Base/Bits/Bits';
import { Nat } from '../../Base/Nat/Nat';
import { $to_bits } from '../../Base/U64/to-bits';
import { $from_nat } from '../../Base/U64/from-nat';
import { $or as $or_bits } from '../../Base/Bits/or';
import { $to_nat } from '../../Base/Bits/to-nat';

// Bitwise OR operation for two U64 numbers.
// - a: The first U64 number.
// - b: The second U64 number.
// = The result of bitwise OR operation on a and b as a U64 number.
export const $or = (a: U64, b: U64): U64 => {
  const bits_a = $to_bits(a);
  const bits_b = $to_bits(b);
  const result_bits = $or_bits(bits_a, bits_b);
  const result_nat = $to_nat(result_bits);
  return $from_nat(result_nat);
};

export const or = (a: U64) => (b: U64) => $or(a, b);

// NOTE: Operator omitted: '_||_'.

// NOTE: For efficiency, we could implement this using native bitwise OR on BigInts:
// export const $or = (a: U64, b: U64): U64 => BigInt.asUintN(64, a | b);
// However, we're keeping the implementation closer to the original Agda code for consistency.
