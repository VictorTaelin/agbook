import { List } from '../../Base/List/Type';
import { String } from '../../Base/String/Type';
import { $foldr } from '../../Base/List/foldr';
import { $append } from '../../Base/String/append';
import { $eq } from '../../Base/String/eq';
import { $if_then_else_ } from '../../Base/Bool/if';

// Joins a list of strings with a separator.
// - sep: The separator string.
// - strs: The list of strings to join.
// = A single string with all input strings concatenated, separated by sep.
export const $join = (sep: String, strs: List<String>): String => 
  $foldr(
    (s: String, acc: String) => 
      $if_then_else_($eq(acc, ""), s, $append($append(s, sep), acc)),
    "",
    strs
  );

export const join = (sep: String) => (strs: List<String>) => $join(sep, strs);

// NOTE: For efficiency, we could use a native implementation:
export const $$join = (sep: String, strs: List<String>): String => {
  const native_strs: string[] = [];
  var current = strs;
  while (current.$ === '::') {
    native_strs.push(current.head);
    current = current.tail;
  }
  return native_strs.join(sep);
};