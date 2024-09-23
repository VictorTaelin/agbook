import { Char } from '../../Base/Char/Type';
import { String } from '../../Base/String/Type';
import { $Cons, $Nil } from '../../Base/List/Type';
import { $from_list } from '../../Base/String/from-list';

// Converts a character to a string
// - c: The input character.
// = A string containing only the input character.
export const $$from_char = (c: Char): String => {
  return $from_list($Cons(c, $Nil));
};

// NOTE: Return the character directly for efficiency.
export const $from_char = (c: Char): String => c;
export const  from_char = (c: Char) => c;
