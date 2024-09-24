import { Float } from '../../Base/Float/Type';
import { U64 } from '../../Base/U64/Type';
import { Nat } from '../../Base/Nat/Type';
import { $to_nat } from '../../Base/U64/to-nat';

// Converts a U64 to a Float
// - x: The U64 to convert.
// = The Float representation of x.
export const $from_u64 = (x: U64): Float => {
  return Number($to_nat(x));
};

export const from_u64 = (x: U64) => $from_u64(x);

// NOTE: We first convert U64 to Nat using to_nat, then use JavaScript's Number() function
// to convert the BigInt to a floating-point number.