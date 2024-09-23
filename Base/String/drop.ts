import { Nat, $Zero } from '../../Base/Nat/Type';
import { String } from '../../Base/String/Type';
import { $to_list } from '../../Base/String/to-list';
import { $from_list } from '../../Base/String/from-list';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $case_of_ } from '../../Base/Function/case';

// Drops the first n characters from a string.
// If n is greater than or equal to the length of the string, returns an empty string.
// - n: The number of characters to drop.
// - s: The input string.
// = The string with the first n characters removed.
export const $$drop = (n: Nat, s: String): String => {
  if (n === 0n) {
    return s;
  } else {
    var n_ = n - 1n;
    return $case_of_($to_list(s), (xs: List<string>) => {
      switch (xs.$) {
        case '[]':
          return "";
        case '::':
          return $$drop(n_, $from_list(xs.tail));
      }
    });
  }
};

// NOTE: Using native string slicing for efficiency
export const $drop = (n: Nat, s: String): String => s.slice(Number(n));
export const  drop = (n: Nat) => (s: String) => s.slice(Number(n));