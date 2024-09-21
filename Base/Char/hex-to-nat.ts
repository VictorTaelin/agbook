import { Char } from '../../Base/Char/Type';
import { Nat } from '../../Base/Nat/Type';
import { Maybe, Some, None } from '../../Base/Maybe/Type';
import { $digit_to_nat } from '../../Base/Char/digit-to-nat';

// Converts a hexadecimal character to its corresponding natural number
export const $hex_to_nat = (c: Char): Maybe<Nat> => {
  var digit_result = $digit_to_nat(c);
  if (digit_result.$ === 'Some') {
    return digit_result;
  } else {
    switch (c) {
      case 'a': case 'A': return Some(10n);
      case 'b': case 'B': return Some(11n);
      case 'c': case 'C': return Some(12n);
      case 'd': case 'D': return Some(13n);
      case 'e': case 'E': return Some(14n);
      case 'f': case 'F': return Some(15n);
      default:  return None;
    }
  }
};

export const hex_to_nat = (c: Char) => $hex_to_nat(c);
