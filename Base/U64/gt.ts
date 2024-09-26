import { U64 } from '../../Base/U64/U64';
import { Bool } from '../../Base/Bool/Bool';
import { $to_nat } from '../../Base/U64/to-nat';

// Compares two U64 values
// - x: The first U64 value
// - y: The second U64 value
// = True if x is greater than y, False otherwise
export const $$gt = (x: U64, y: U64): Bool => {
  return $to_nat(x) > $to_nat(y);
};

// NOTE: Using native BigInt comparison for efficiency
export const $gt = (x: U64, y: U64): Bool => x > y;
export const  gt = (x: U64) => (y: U64) => x > y;

// NOTE: Operator omitted: '_>_'