import { Int } from '../../Base/Int/Int';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { $compare } from '../../Base/Int/compare';

// Greater-than-or-equal-to comparison for integers.
// - x: The 1st integer.
// - y: The 2nd integer.
// = True if x is greater than or equal to y, False otherwise.
export const $$gte = (a: Int, b: Int): Bool => {
  switch ($compare(a, b).$) {
    case 'LT':
      return $False;
    case 'EQ':
      return $True;
    case 'GT':
      return $True;
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $gte = (a: Int, b: Int): Bool => a >= b;
export const  gte = (a: Int) => (b: Int) => a >= b;