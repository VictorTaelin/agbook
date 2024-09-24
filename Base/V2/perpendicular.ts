import { F64 } from '../../Base/F64/Type';
import { $negate } from '../../Base/F64/negate';
import { V2, $MkV2 } from '../../Base/V2/Type';

// Calculates a vector perpendicular to the given V2 vector.
// - v: The V2 vector.
// = A new V2 vector perpendicular to v (rotated 90 degrees counterclockwise).
export const $perpendicular = (v: V2): V2 => {
  return $MkV2($negate(v.y), v.x);
};

export const perpendicular = (v: V2) => $perpendicular(v);
