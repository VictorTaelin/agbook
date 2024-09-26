import { Int } from '../../Base/Int/Int';
import { Bool } from '../../Base/Bool/Bool';
import { $eq as $nat_eq } from '../../Base/Nat/eq';

// Checks if two integers are equal.
// - x: The 1st integer.
// - y: The 2nd integer.
// = True if x and y are equal, False otherwise.
export const $$eq = (x: Int, y: Int): Bool => {
  if (x >= 0n && y >= 0n) {
    return $nat_eq(x, y);
  } else if (x < 0n && y < 0n) {
    return $nat_eq(-x - 1n, -y - 1n);
  } else {
    return false;
  }
};

// NOTE: Using native BigInt equality for efficiency
export const $eq = (x: Int, y: Int): Bool => x === y;
export const  eq = (x: Int) => (y: Int) => x === y;

// NOTE: Operator omitted: '_==_'.