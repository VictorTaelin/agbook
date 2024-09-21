import { String } from '../../Base/String/Type';
import { Char } from '../../Base/Char/Type';
import { List, $Nil, $Cons } from '../../Base/List/Type';

// Converts a string to a list of characters.
// - s: The input string.
// = A list of characters representing the string.
export const $to_list = (s: String): List<Char> => {
  if (s === "") {
    return $Nil;
  } else {
    var head = s[0];
    var tail = s.slice(1);
    return $Cons(head, $to_list(tail));
  }
};

export const to_list = (s: String) => $to_list(s);

// NOTE: Using native string operations for efficiency.
