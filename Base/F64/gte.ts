import { Float } from '../../Base/Float/Type';
import { Bool } from '../../Base/Bool/Type';
import { $not } from '../../Base/Bool/not';
import { $lt } from '../../Base/Float/lt';

// Compares two Float values for greater than or equal to relationship.
// - x: The first Float value.
// - y: The second Float value.
// = True if x is greater than or equal to y, False otherwise.
export const $$gte = (x: Float, y: Float): Bool => $not($lt(x, y));

// NOTE: Using native JavaScript greater than or equal to operator for efficiency.
export const $gte = (x: Float, y: Float): Bool => x >= y;
export const  gte = (x: Float) => (y: Float) => x >= y;

// NOTE: Operator omitted: '_>=_'.