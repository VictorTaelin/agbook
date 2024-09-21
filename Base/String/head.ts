import { String } from '../../Base/String/Type';
import { Char } from '../../Base/Char/Type';
import { Maybe, None, Some } from '../../Base/Maybe/Type';

// Retrieves the first character of a string.
// - s: The input string.
// = Some c if the string is non-empty (where c is the first character),
//   None if the string is empty.
export const $$head = (s: String): Maybe<Char> => {
  if (s === "") {
    return None;
  } else {
    var head = s[0];
    return Some(head);
  }
};

// NOTE: Using native string operations for efficiency.
export const $head = (s: String): Maybe<Char> => s === "" ? None : Some(s[0]);
export const  head = (s: String) => $head(s);