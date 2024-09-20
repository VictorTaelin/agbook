import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';
import { $to_nat } from '../../Base/Char/to-nat';
import { $gte as Nat$gte } from '../../Base/Nat/gte';

// Checks if one character is greater than or equal to another.
// - x: The first character.
// - y: The second character.
// = True if x is greater than or equal to y, False otherwise.
export const $gte = (x: Char, y: Char): Bool => {
  return Nat$gte($to_nat(x), $to_nat(y));
};

export const gte = (x: Char) => (y: Char) => $gte(x, y);

// NOTE: Operator omitted: '_>=_'

// NOTE: For efficiency, we could use native string comparison:
// export const $gte = (x: Char, y: Char): Bool => x >= y;
// However, we're keeping the original algorithm to maintain consistency with Agda.