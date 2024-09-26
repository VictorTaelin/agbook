import { String } from '../../Base/String/String';
import { $to_list } from '../../Base/String/to-list';
import { $from_list } from '../../Base/String/from-list';
import { $split_at as $list_split_at } from '../../Base/List/split-at';
import { Nat } from '../../Base/Nat/Nat';
import { Pair, $Pair } from '../../Base/Pair/Pair';

// Splits a string at the given index.
// - n: The index at which to split the string.
// - s: The input string.
// = A pair of strings, where the first string contains the characters before the index,
//   and the second string contains the characters from the index onwards.
export const $$split_at = (n: Nat, s: String): Pair<String, String> => {
  const chars      = $to_list(s);
  const [fst, snd] = $list_split_at(n, chars);
  return $Pair($from_list(fst), $from_list(snd));
};

// NOTE: Using native string operations for efficiency.
export const $split_at = (n: Nat, s: String): Pair<String, String> => {
  return $Pair(s.slice(0, Number(n)), s.slice(Number(n)));
};

export const split_at = (n: Nat) => (s: String) => $split_at(n, s);
