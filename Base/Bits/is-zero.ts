import { Bits } from '../../Base/Bits/Bits';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { $and } from '../../Base/Bool/and';

// Checks if a number in bits is zero or empty.
// - n: The number of bits to use.
// = True if the number is zero and false otherwise.
export const $is_zero = (bits: Bits): Bool => {
  switch (bits.$) {
    case 'E':
      return $True;
    case 'O':
      return $and($True, $is_zero(bits.tail));
    case 'I':
      return $False;
  }
};

export const is_zero = (bits: Bits) => $is_zero(bits);
