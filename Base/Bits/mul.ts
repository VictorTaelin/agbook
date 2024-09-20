import { Bits, O, I, E } from '../../Base/Bits/Type';
import { $add } from '../../Base/Bits/add';

// Performs multiplication of two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the product of a and b.
export const $mul = (a: Bits, b: Bits): Bits => {
  switch (a.$) {
    case 'E':
      return E;
    case 'O':
      return O($mul(a.tail, b));
    case 'I':
      return $add(b, O($mul(a.tail, b)));
  }
};

export const mul = (a: Bits) => (b: Bits) => $mul(a, b);

// NOTE: Operator omitted: '_*_'.
