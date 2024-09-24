import { Float } from '../../Base/Float/Type';
import { Bool } from '../../Base/Bool/Type';
import { $lt } from '../../Base/Float/lt';

// Compares two Float values for less than or equal to relationship.
// - x: The first Float value.
// - y: The second Float value.
// = True if x is less than or equal to y, False otherwise.
export const $$lte = (x: Float, y: Float): Bool => {
  return !$lt(y, x);
};

// NOTE: Using native JavaScript less than or equal to operator for efficiency.
export const $lte = (x: Float, y: Float): Bool => x <= y;
export const  lte = (x: Float) => (y: Float) => x <= y;

// NOTE: Operator omitted: '_<=_'.