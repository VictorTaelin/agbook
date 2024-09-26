import { Nat, $Zero } from '../../Base/Nat/Nat';
import { Char } from '../../Base/Char/Char';
import { String } from '../../Base/String/String';
import { $from_char } from '../../Base/String/from-char';
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
