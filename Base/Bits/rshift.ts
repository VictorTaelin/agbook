import { Bits, $O, $I, $E } from '../../Base/Bits/Type';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Type';

// Performs right shift operation on a Bits value.
// - bits: The input Bits value.
// - n: The number of positions to shift right (represented as Nat).
// = A new Bits value representing the right-shifted result.
export const $rshift = (bits: Bits, n: Nat): Bits => {
  if (n === 0n) {
    return bits;
  }
  switch (bits.$) {
    case 'E':
      return $E;
    case 'O':
    case 'I':
      return $rshift(bits.tail, n - 1n);
  }
};

export const rshift = (bits: Bits) => (n: Nat) => $rshift(bits, n);

// NOTE: Operator omitted: '_>>_'.
