import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';
import { $to_list } from '../../Base/String/to-list';
import { $gte as $list_gte } from '../../Base/List/gte';
import { OrdChar } from '../../Base/Char/Trait/Ord';

export const $gte = (s1: String, s2: String): Bool => {
  return $list_gte(OrdChar, $to_list(s1), $to_list(s2));
};

export const gte = (s1: String) => (s2: String) => $gte(s1, s2);

// NOTE: Operator omitted: '_>=_'.