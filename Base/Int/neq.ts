import { Int } from '../../Base/Int/Int';
import { Bool } from '../../Base/Bool/Bool';
import { $eq } from '../../Base/Int/eq';
import { $not } from '../../Base/Bool/not';

// Checks if two integers are not equal.
// - x: The 1st integer.
// - y: The 2nd integer.
// = True if x and y are not equal, False otherwise.
export const $$neq = (x: Int, y: Int): Bool => {
  return $not($eq(x, y));
};

// NOTE: Using native BigInt inequality for efficiency
export const $neq = (x: Int, y: Int): Bool => x !== y;
export const  neq = (x: Int) => (y: Int) => x !== y;

// NOTE: Operator omitted: '_!=_'.