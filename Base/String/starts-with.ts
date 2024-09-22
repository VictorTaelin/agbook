import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { Char } from '../../Base/Char/Type';
import { $eq } from '../../Base/Char/eq';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { String } from '../../Base/String/Type';
import { $to_list } from '../../Base/String/to-list';

// Checks if the first string starts with the second string.
// Returns True if str starts with prefix, False otherwise.
export const $starts_with = (str: String, prefix: String): Bool => {
  return $starts_with_list($to_list(str), $to_list(prefix));
};

export const starts_with = (str: String) => (prefix: String) => $starts_with(str, prefix);

const $starts_with_list = (str_list: List<Char>, prefix_list: List<Char>): Bool => {
  switch (str_list.$) {
    case '[]':
      switch (prefix_list.$) {
        case '[]':
          return $True;
        case '::':
          return $False;
      }
    case '::':
      switch (prefix_list.$) {
        case '[]':
          return $True;
        case '::':
          return $if_then_else_(
            $eq(str_list.head, prefix_list.head),
            $starts_with_list(str_list.tail, prefix_list.tail),
            $False
          );
      }
  }
};

// NOTE: For efficiency, we can use the native string startsWith method
export const $$starts_with = (str: String, prefix: String): Bool => str.startsWith(prefix);