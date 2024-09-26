import { U64 } from '../../Base/U64/U64';
import { Bool } from '../../Base/Bool/Bool';
import { $eq as nat_eq } from '../../Base/Nat/eq';
import { $to_nat } from '../../Base/U64/to-nat';

// Compares two U64 values for equality
export const $$eq = (x: U64, y: U64): Bool => {
  return nat_eq($to_nat(x), $to_nat(y));
};

// NOTE: Using native BigInt equality for efficiency
export const $eq = (x: U64, y: U64): Bool => x === y;
export const  eq = (x: U64) => (y: U64) => x === y;

// NOTE: Operator omitted: '_==_'.
