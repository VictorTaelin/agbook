import { Int } from '../../Base/Int/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $compare } from '../../Base/Int/compare';

// Less-than comparison for integers.
// - x: The 1st integer.
// - y: The 2nd integer.
// = True if x is less than y, False otherwise.
export const $$lt = (a: Int, b: Int): Bool => {
  switch ($compare(a, b).$) {
    case 'LT':
      return $True;
    case 'EQ':
      return $False;
    case 'GT':
      return $False;
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $lt = (a: Int, b: Int): Bool => a < b;
export const  lt = (a: Int) => (b: Int) => a < b;