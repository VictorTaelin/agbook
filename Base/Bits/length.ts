import { Bits } from '../../Base/Bits/Type';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Type';

// Returns the length of a Bits structure, that is, how many bits it has.
export const $$length = (bits: Bits): Nat => {
  switch (bits.$) {
    case 'E':
      return $Zero;
    case 'O':
    case 'I':
      return $Succ($$length(bits.tail));
  }
};

// NOTE: Using native BigInt operations for efficiency
export const $length = (bits: Bits): Nat => {
  var len = 0n;
  while (bits.$ !== 'E') {
    len += 1n;
    bits = bits.tail;
  }
  return len;
};

export const length = (bits: Bits) => $length(bits);
