import { U64 } from '../../Base/U64/Type';
import { Bool } from '../../Base/Bool/Type';
import { $lt as nat_lt } from '../../Base/Nat/lt';
import { $to_nat } from '../../Base/U64/to-nat';

// Compares two U64 values.
// - x: The first U64 value.
// - y: The second U64 value.
// = True if x is less than y, False otherwise.
export const $$lt = (x: U64, y: U64): Bool => {
  return nat_lt($to_nat(x), $to_nat(y));
};

// NOTE: Using native BigInt comparison for efficiency
export const $lt = (x: U64, y: U64): Bool => x < y;
export const  lt = (x: U64) => (y: U64) => x < y;

// NOTE: Operator omitted: '_<_'