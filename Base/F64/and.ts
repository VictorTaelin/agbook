import { $and as bool_and } from '../../Base/Bool/and';
import { $not } from '../../Base/Bool/not';
import { Bool } from '../../Base/Bool/Bool';
import { F64 } from '../../Base/F64/F64';
import { $eq } from '../../Base/F64/eq';

// Performs logical AND on two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = true if both x and y are true.
export const $and = (x: F64, y: F64): Bool => 
  bool_and($not($eq(0.0, x)), $not($eq(0.0, y)));

export const and = (x: F64) => (y: F64): Bool => 
  $and(x, y);

// NOTE: The infix version '_&&_' is omitted in TypeScript.
