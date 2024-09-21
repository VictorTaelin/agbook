import { U64 } from '../../Base/U64/Type';
import { $sub as $nat_sub } from '../../Base/Nat/sub';
import { $add as $nat_add } from '../../Base/Nat/add';
import { $to_nat } from '../../Base/U64/to-nat';
import { $from_nat } from '../../Base/U64/from-nat';

// Subtracts one U64 from another.
// - a: The U64 to subtract from.
// - b: The U64 to subtract.
// = The result of a - b, wrapping around if b > a.
export const $sub = (a: U64, b: U64): U64 => {
  const max_u64 = 18446744073709551616n;
  return $from_nat($nat_sub($nat_add($to_nat(a), max_u64), $to_nat(b)));
};

export const sub = (a: U64) => (b: U64) => $sub(a, b);

// NOTE: Operator '_-_' omitted.

// For efficiency, we also provide a native implementation:
export const $$sub = (a: U64, b: U64): U64 => {
  return BigInt.asUintN(64, a - b);
};