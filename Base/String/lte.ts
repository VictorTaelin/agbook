import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';
import { $to_list } from '../../Base/String/to-list';
import { $lte as $list_lte } from '../../Base/List/lte';
import { OrdChar } from '../../Base/Char/Trait/Ord';

export const $lte = (s1: String, s2: String): Bool => {
  return $list_lte(OrdChar, $to_list(s1), $to_list(s2));
};

export const lte = (s1: String) => (s2: String): Bool => $lte(s1, s2);

// NOTE: Operator omitted: '_<=_'.