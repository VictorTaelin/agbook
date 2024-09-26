import { F64 } from '../../Base/F64/F64';
import { U64 } from '../../Base/U64/U64';
import { Nat } from '../../Base/Nat/Nat';
import { $to_nat } from '../../Base/U64/to-nat';

// Converts a U64 to a F64
// - x: The U64 to convert.
// = The F64 representation of x.
export const $from_u64 = (x: U64): F64 => {
  return Number($to_nat(x));
};

export const from_u64 = (x: U64) => $from_u64(x);

// NOTE: We first convert U64 to Nat using to_nat, then use JavaScript's Number() function
// to convert the BigInt to a floating-point number.
