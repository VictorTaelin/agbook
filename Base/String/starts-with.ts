import { Bool } from '../../Base/Bool/Bool';
import { Char } from '../../Base/Char/Char';
import { EqChar } from '../../Base/Char/Trait/Eq';
import { List } from '../../Base/List/List';
import { String } from '../../Base/String/String';
import { $to_list } from '../../Base/String/to-list';
import { $starts_with as $list_starts_with } from '../../Base/List/starts-with';

// Checks if the first string starts with the second string.
// Returns True if str starts with prefix, False otherwise.
export const $$starts_with = (str: String, prefix: String): Bool => {
  return $list_starts_with(EqChar)($to_list(prefix), $to_list(str));
};

// NOTE: For efficiency, we use the native string startsWith method
export const $starts_with = (str: String, prefix: String): Bool => str.startsWith(prefix);
export const  starts_with = (str: String) => (prefix: String): Bool => str.startsWith(prefix);
