import { Nat } from '../../Base/Nat/Nat';
import { Bool } from '../../Base/Bool/Bool';
import { $or } from '../../Base/Bool/or';
import { $gt } from '../../Base/Nat/gt';
import { $eq } from '../../Base/Nat/eq';

export const $$gte = (x: Nat, y: Nat): Bool => {
  return $or($eq(x, y), $gt(x, y));
};

// NOTE: Using native BigInt comparison for efficiency
export const $gte = (x: Nat, y: Nat): Bool => x >= y;
export const  gte = (x: Nat) => (y: Nat) => x >= y;

// NOTE: Operator omitted: '_>=_'
