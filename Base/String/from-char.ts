import { Char } from '../../Base/Char/Type';
import { String } from '../../Base/String/Type';
import { $Cons, $Nil } from '../../Base/List/Type';
import { $from_list } from '../../Base/String/from-list';

// Converts a character to a string
export const $from_char = (c: Char): String => {
  return $from_list($Cons(c, $Nil));
};

export const from_char = (c: Char) => $from_char(c);

// NOTE: For efficiency, we can directly return the character as a string
// since we're using native string representation for both Char and String.
export const $$from_char = (c: Char): String => c;