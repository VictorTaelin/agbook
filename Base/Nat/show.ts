import { Nat } from '../../Base/Nat/Nat';
import { String } from '../../Base/String/String';

// Converts a Nat (BigInt) to its string representation.
export const $show = (n: Nat): String => n.toString();
export const  show = (n: Nat) => $show(n);

// NOTE: Using native BigInt.toString() for efficiency.