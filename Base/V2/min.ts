import { V2, $MkV2 } from '../../Base/V2/V2';
import { $min as F64$min } from '../../Base/F64/min';

export const $min = (v1: V2, v2: V2): V2 => {
  return $MkV2(
    F64$min(v1.x, v2.x),
    F64$min(v1.y, v2.y)
  );
};

export const min = (v1: V2) => (v2: V2) => $min(v1, v2);
