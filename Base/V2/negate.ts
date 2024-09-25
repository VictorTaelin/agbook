import { F64 } from '../../Base/F64/Type';
import { V2, $MkV2 } from '../../Base/V2/Type';
import { $negate as float_negate } from '../../Base/F64/negate';

// Negates a V2 vector.
// - v: The V2 vector to negate.
// = A new V2 vector with negated coordinates.
export const $negate = (v: V2): V2 => $MkV2(float_negate(v.x), float_negate(v.y));
export const  negate = (v: V2) => $negate(v);

// NOTE: Infix notation '-_' is not directly translatable to TypeScript.
// Users should use the 'negate' function instead.
