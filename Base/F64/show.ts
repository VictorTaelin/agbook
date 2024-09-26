import { F64 } from '../../Base/F64/F64';
import { String } from '../../Base/String/String';

// Converts a F64 to its string representation.
// - x: The F64 value to be converted.
// = A string representation of the F64.
export const $show = (x: F64): String => x.toString();
export const  show = (x: F64) => $show(x);

// NOTE: Using native JavaScript toString() method for efficiency.
