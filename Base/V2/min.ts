import { V2, $MkV2 } from '../../Base/V2/Type';
import { $min as Float$min } from '../../Base/Float/min';

export const $min = (v1: V2, v2: V2): V2 => {
  return $MkV2(
    Float$min(v1.x, v2.x),
    Float$min(v1.y, v2.y)
  );
};

export const min = (v1: V2) => (v2: V2) => $min(v1, v2);