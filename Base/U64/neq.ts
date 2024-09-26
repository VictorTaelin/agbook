import { U64 } from '../../Base/U64/U64';
import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';
import { $eq as u64_eq } from '../../Base/U64/eq';

// Compares two U64 values for inequality
export const $$neq = (x: U64, y: U64): Bool => {
  return $not(u64_eq(x, y));
};

// NOTE: Using native BigInt inequality for efficiency
export const $neq = (x: U64, y: U64): Bool => x !== y;
export const  neq = (x: U64) => (y: U64) => x !== y;

// NOTE: Operator omitted: '_!=_'.
