import { Float } from '../../Base/Float/Type';
import { String } from '../../Base/String/Type';

// Converts a Float to its string representation.
// - x: The Float value to be converted.
// = A string representation of the Float.
export const $show = (x: Float): String => x.toString();
export const  show = (x: Float) => $show(x);

// NOTE: Using native JavaScript toString() method for efficiency.
