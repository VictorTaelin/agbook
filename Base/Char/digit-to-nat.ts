import { Char } from '../../Base/Char/Char';
import { Nat } from '../../Base/Nat/Nat';
import { Maybe, Some, None } from '../../Base/Maybe/Maybe';

// Converts a digit character to its corresponding natural number
export const $digit_to_nat = (c: Char): Maybe<Nat> => {
  switch (c) {
    case '0': return Some(0n);
    case '1': return Some(1n);
    case '2': return Some(2n);
    case '3': return Some(3n);
    case '4': return Some(4n);
    case '5': return Some(5n);
    case '6': return Some(6n);
    case '7': return Some(7n);
    case '8': return Some(8n);
    case '9': return Some(9n);
    default:  return None;
  }
};

export const digit_to_nat = (c: Char) => $digit_to_nat(c);
