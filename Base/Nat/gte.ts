import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';
import { $or } from '../../Base/Bool/or';
import { $gt } from '../../Base/Nat/gt';
import { $eq } from '../../Base/Nat/eq';

// Greater-than-or-equal-to comparison for nats.
// - x: The 1st nat.
// - y: The 2nd nat.
// = True if x is greater than or equal to y.
export const $$gte = (x: Nat, y: Nat): Bool => $or($eq(x, y), $gt(x, y));

// NOTE: Using native BigInt comparison for efficiency.
export const $gte = (x: Nat, y: Nat): Bool => x >= y;
export const  gte = (x: Nat) => (y: Nat) => x >= y;