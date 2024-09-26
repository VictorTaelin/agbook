import { Int } from '../../Base/Int/Int';
import { String } from '../../Base/String/String';
import { $show as $show_nat } from '../../Base/Nat/show';
import { $append } from '../../Base/String/append';

// Converts an integer to its string representation.
// - n: The integer to convert.
// = A string representation of the integer.
export const $$show = (n: Int): String => {
  if (n >= 0n) {
    return $show_nat(n);
  } else {
    return $append('-', $show_nat(-n));
  }
};

// NOTE: Using native BigInt.toString() for efficiency.
export const $show = (n: Int): String => n.toString();
export const  show = (n: Int) => $show(n);
