import { String } from '../../Base/String/String';
import { Bool } from '../../Base/Bool/Bool';
import { $to_list } from '../../Base/String/to-list';
import { $lt as $list_lt } from '../../Base/List/lt';
import { OrdChar } from '../../Base/Char/Trait/Ord';

export const $lt = (s1: String, s2: String): Bool => {
  return $list_lt(OrdChar, $to_list(s1), $to_list(s2));
};

export const lt = (s1: String) => (s2: String): Bool => $lt(s1, s2);

// NOTE: Operator omitted: '_<_'.
