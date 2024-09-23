import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';
import { $to_list } from '../../Base/String/to-list';
import { $gt as $list_gt } from '../../Base/List/gt';
import { OrdChar } from '../../Base/Char/Trait/Ord';

export const $gt = (s1: String, s2: String): Bool => {
  return $list_gt(OrdChar, $to_list(s1), $to_list(s2));
};

export const gt = (s1: String) => (s2: String) => $gt(s1, s2);

// NOTE: Operator omitted: '_>_'.