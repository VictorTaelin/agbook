import { Nat } from '../../Base/Nat/Type';
import { String } from '../../Base/String/Type';

// Converts a Nat (BigInt) to its string representation.
export const $show = (n: Nat): String => n.toString();
export const  show = (n: Nat) => $show(n);

// NOTE: Using native BigInt.toString() for efficiency.