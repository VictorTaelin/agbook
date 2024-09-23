import { $foldr as List_foldr } from '../../Base/List/foldr';
import { Char } from '../../Base/Char/Type';
import { String } from '../../Base/String/Type';
import { $to_list } from '../../Base/String/to-list';

// Performs a right fold over a string.
// - f: The combining function.
// - z: The initial value (for the empty string case).
// - s: The string to fold over.
// = The result of folding the string.
export const $foldr = <A>(f: (c: Char, a: A) => A, z: A, s: String): A => {
  return List_foldr(f, z, $to_list(s));
};

export const foldr = <A>(f: (c: Char, a: A) => A) => (z: A) => (s: String) => $foldr(f, z, s);
