import { U64 } from '../../Base/U64/Type';
import { Bits } from '../../Base/Bits/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { $double } from '../../Base/Nat/double';
import { $from_nat } from '../../Base/U64/from-nat';

// Converts a bit representation to a Maybe U64.
// - x: The bit representation to convert.
// = The U64 representation of x, or nothing if conversion fails.
export const $from_bits = (b: Bits): Maybe<U64> => {
  const from_bits_go = (bs: Bits, acc: Nat): Maybe<U64> => {
    switch (bs.$) {
      case 'E':
        return $Some($from_nat(acc));
      case 'O':
        return from_bits_go(bs.tail, $double(acc));
      case 'I':
        return from_bits_go(bs.tail, $double(acc) + 1n);
    }
  };

  return from_bits_go(b, $Zero);
};

export const from_bits = (b: Bits) => $from_bits(b);

// NOTE: Using BigInt operations for efficiency while preserving the original algorithm.