import { Float } from '../../Base/Float/Type';
import { Bool } from '../../Base/Bool/Type';
import { $lt } from '../../Base/Float/lt';

// Compares two Float values for greater than relationship.
// - x: The first Float value.
// - y: The second Float value.
// = True if x is greater than y, False otherwise.
export const $gt = (x: Float, y: Float): Bool => $lt(y, x);
export const  gt = (x: Float) => (y: Float) => $lt(y, x);

// NOTE: Using native JavaScript greater than operator for efficiency.
export const $$gt = (x: Float, y: Float): Bool => x > y;

// NOTE: Operator omitted: '_>_'.