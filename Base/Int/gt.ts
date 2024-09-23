import { Int } from '../../Base/Int/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $compare } from '../../Base/Int/compare';

// Greater-than comparison for integers.
// - x: The 1st integer.
// - y: The 2nd integer.
// = True if x is greater than y, False otherwise.
export const $$gt = (a: Int, b: Int): Bool => {
  switch ($compare(a, b).$) {
    case 'LT': return $False;
    case 'EQ': return $False;
    case 'GT': return $True;
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $gt = (a: Int, b: Int): Bool => a > b;
export const  gt = (a: Int) => (b: Int) => a > b;
