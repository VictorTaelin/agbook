import { Bool } from '../../Base/Bool/Bool';
import { U64 } from '../../Base/U64/U64';
import { $from_nat } from '../../Base/U64/from-nat';

// Converts a Bool to a U64 number.
// - b: The input Bool value.
// = The corresponding U64 value (1 for True, 0 for False).
export const $from_bool = (b: Bool): U64 => {
  if (b) {
    return $from_nat(1n);
  } else {
    return $from_nat(0n);
  }
};

export const from_bool = (b: Bool) => $from_bool(b);

// NOTE: Using native boolean check for efficiency.