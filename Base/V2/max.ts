import { V2, $MkV2 } from '../../Base/V2/Type';
import { $max as F64$max } from '../../Base/F64/max';

export const $max = (v1: V2, v2: V2): V2 => {
  return $MkV2(
    F64$max(v1.x, v2.x),
    F64$max(v1.y, v2.y)
  );
};

export const max = (v1: V2) => (v2: V2) => $max(v1, v2);
