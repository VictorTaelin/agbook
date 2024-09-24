import { Bits } from '../../Base/Bits/Type';
import { Float } from '../../Base/Float/Type';
import { $from_u64 } from '../../Base/Float/from-u64';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { U64 } from '../../Base/U64/Type';
import { $from_bits as u64_from_bits } from '../../Base/U64/from-bits';

// Converts a bit representation to a Float
// - b: The bit representation to convert.
// = The Float representation of b, or nothing if conversion fails.
export const $from_bits = (b: Bits): Maybe<Float> => {
  const helper = (m: Maybe<U64>): Maybe<Float> => {
    switch (m.$) {
      case 'Some':
        return $Some($from_u64(m.value));
      case 'None':
        return $None;
    }
  };

  return helper(u64_from_bits(b));
};

export const from_bits = (b: Bits) => $from_bits(b);
