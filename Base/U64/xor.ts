import { U64 } from '../../Base/U64/Type';
import { Bits } from '../../Base/Bits/Type';
import { $xor as $xorB } from '../../Base/Bits/xor';
import { $to_bits } from '../../Base/U64/to-bits';
import { $to_nat } from '../../Base/Bits/to-nat';
import { $from_nat } from '../../Base/U64/from-nat';

// Bitwise XOR operation on two U64 numbers.
// - a: The first U64 number.
// - b: The second U64 number.
// = The result of bitwise XOR of a and b as a U64 number.
export const $$xor = (a: U64, b: U64): U64 => {
  return $from_nat($to_nat($xorB($to_bits(a), $to_bits(b))));
};

// NOTE: Using native BigInt XOR operation for efficiency
export const $xor = (a: U64, b: U64): U64 => {
  return BigInt.asUintN(64, a ^ b);
};

export const xor = (a: U64) => (b: U64) => $xor(a, b);

// NOTE: Operator '_^_' omitted.