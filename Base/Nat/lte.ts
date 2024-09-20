import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';
import { $or } from '../../Base/Bool/or';
import { $eq } from '../../Base/Nat/eq';
import { $lt } from '../../Base/Nat/lt';

export const $$lte = (x: Nat, y: Nat): Bool => {
  return $or($eq(x, y), $lt(x, y));
};

// NOTE: Using native BigInt comparison for efficiency
export const $lte = (x: Nat, y: Nat): Bool => x <= y;
export const  lte = (x: Nat) => (y: Nat) => x <= y;

// NOTE: Operator omitted: '_<=_'
