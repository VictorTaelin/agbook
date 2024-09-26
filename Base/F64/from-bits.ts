import { Bits } from '../../Base/Bits/Bits';
import { F64 } from '../../Base/F64/F64';
import { $from_u64 } from '../../Base/F64/from-u64';
import { Maybe, $Some, $None } from '../../Base/Maybe/Maybe';
import { U64 } from '../../Base/U64/U64';
import { $from_bits as u64_from_bits } from '../../Base/U64/from-bits';

// Converts a bit representation to a F64
// - b: The bit representation to convert.
// = The F64 representation of b, or nothing if conversion fails.
export const $from_bits = (b: Bits): Maybe<F64> => {
  const helper = (m: Maybe<U64>): Maybe<F64> => {
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
