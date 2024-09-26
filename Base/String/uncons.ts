import { Char } from '../../Base/Char/Char';
import { Maybe, $None, $Some } from '../../Base/Maybe/Maybe';
import { Sigma, $Sigma } from '../../Base/Pair/Pair';
import { String } from '../../Base/String/String';

// Deconstructs a string into its first character and the rest.
// - s: The input string.
// = Just (first character, rest of the string) if the string is non-empty,
//   Nothing if the string is empty.
export const $uncons = (s: String): Maybe<Sigma<Char, String>> => {
  if (s === "") {
    return $None;
  } else {
    var head = s[0];
    var tail = s.slice(1);
    return $Some($Sigma(head, tail));
  }
};

export const uncons = (s: String) => $uncons(s);

// NOTE: Using native string operations for efficiency.