import { $and as bool_and } from '../../Base/Bool/and';
import { $not } from '../../Base/Bool/not';
import { Bool } from '../../Base/Bool/Type';
import { Float } from '../../Base/Float/Type';
import { $eq } from '../../Base/Float/eq';

// Performs logical AND on two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = true if both x and y are true.
export const $and = (x: Float, y: Float): Bool => 
  bool_and($not($eq(0.0, x)), $not($eq(0.0, y)));

export const and = (x: Float) => (y: Float): Bool => 
  $and(x, y);

// NOTE: The infix version '_&&_' is omitted in TypeScript.