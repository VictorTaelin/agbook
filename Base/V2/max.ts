import { V2, $MkV2 } from '../../Base/V2/Type';
import { $max as Float$max } from '../../Base/Float/max';

export const $max = (v1: V2, v2: V2): V2 => {
  return $MkV2(
    Float$max(v1.x, v2.x),
    Float$max(v1.y, v2.y)
  );
};

export const max = (v1: V2) => (v2: V2) => $max(v1, v2);
