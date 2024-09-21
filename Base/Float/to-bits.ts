import { Bits, $E } from '../../Base/Bits/Type';
import { $to_u64 } from '../../Base/Float/to-u64';
import { Float } from '../../Base/Float/Type';
import { $to_bits as $u64_to_bits } from '../../Base/U64/to-bits';

// Converts a float to its bit representation as Bits.
// - x: The float to convert.
// = The Bits representation of x, or an empty bit sequence if conversion fails.
export const $to_bits = (x: Float): Bits => {
  var u64_maybe = $to_u64(x);
  switch (u64_maybe.$) {
    case 'Some':
      return $u64_to_bits(u64_maybe.value);
    case 'None':
      return $E;
  }
};

export const to_bits = (x: Float) => $to_bits(x);
