import { F64 } from '../../Base/F64/F64';
import { Maybe, $Some, $None } from '../../Base/Maybe/Maybe';
import { U64 } from '../../Base/U64/U64';

// Converts a float to its U64 representation.
// - x: The float to convert
// = The U64 representation of x, or nothing if conversion fails.
export const $to_u64 = (x: F64): Maybe<U64> => {
  if (x >= 0 && x < 2 ** 64 && Math.floor(x) === x) {
    return $Some(BigInt(x));
  } else {
    return $None;
  }
};

export const to_u64 = (x: F64) => $to_u64(x);

// NOTE: This implementation checks if the float is within the valid range for U64
// (0 to 2^64 - 1) and is an integer before converting. It returns None for values 
// outside this range or for non-integer values.
