import { Nat, $Zero } from '../../Base/Nat/Type';
import { Char } from '../../Base/Char/Type';
import { String } from '../../Base/String/Type';
import { $from_char } from '../../Base/String/from_char';
import { $append } from '../../Base/String/append';

// Replicates a character n times to create a string.
// - n: The number of times to replicate the character.
// - c: The character to replicate.
// = A string consisting of n repetitions of c.
export const $$replicate = (n: Nat, c: Char): String => {
  if (n === 0n) {
    return "";
  } else {
    var pred = n - 1n;
    return $append($from_char(c), $$replicate(pred, c));
  }
};

// NOTE: Using native string repeat for efficiency.
export const $replicate = (n: Nat, c: Char): String => c.repeat(Number(n));
export const  replicate = (n: Nat) => (c: Char) => $replicate(n, c);

// TSC Error: Base/String/replicate.ts(4,28): error TS2792: Cannot find module '../../Base/String/from_char'. Did you mean to set the 'moduleResolution' option to 'nodenext', or to add aliases to the 'paths' option?
