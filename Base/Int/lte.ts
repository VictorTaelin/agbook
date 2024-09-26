import { Int } from '../../Base/Int/Int';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { $compare } from '../../Base/Int/compare';

// Less-than-or-equal-to comparison for integers.
// - x: The 1st integer.
// - y: The 2nd integer.
// = True if x is less than or equal to y, False otherwise.
export const $$lte = (a: Int, b: Int): Bool => {
  switch ($compare(a, b).$) {
    case 'LT': return $True;
    case 'EQ': return $True;
    case 'GT': return $False;
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $lte = (a: Int, b: Int): Bool => a <= b;
export const  lte = (a: Int) => (b: Int) => a <= b;