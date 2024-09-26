import { Char } from '../../Base/Char/Char';
import { Nat } from '../../Base/Nat/Nat';

// Converts a character to its Unicode code point.
// - c: The input character.
// = The Unicode code point of the character as a Nat (BigInt).
export const $to_nat = (c: Char): Nat => BigInt(c.charCodeAt(0));
export const  to_nat = (c: Char) => $to_nat(c);

// NOTE: Using native JavaScript charCodeAt method and converting to BigInt for efficiency.
