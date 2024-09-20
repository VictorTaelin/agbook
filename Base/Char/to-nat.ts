import { Char } from '../../Base/Char/Type';
import { Nat } from '../../Base/Nat/Type';

// Converts a character to its Unicode code point.
// - c: The input character.
// = The Unicode code point of the character as a Nat (BigInt).
export const $to_nat = (c: Char): Nat => BigInt(c.charCodeAt(0));
export const  to_nat = (c: Char) => $to_nat(c);

// NOTE: Using native JavaScript charCodeAt method to get the Unicode code point,
// then converting it to a BigInt to match the Nat type.