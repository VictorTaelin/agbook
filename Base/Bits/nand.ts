import { Bits } from '../../Base/Bits/Type';
import { $and } from '../../Base/Bits/and';
import { $not } from '../../Base/Bits/not';

// Performs bitwise NAND operation on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the bitwise NAND of a and b.
export const $nand = (a: Bits, b: Bits): Bits => $not($and(a, b));

export const nand = (a: Bits) => (b: Bits) => $nand(a, b);

// NOTE: Operator omitted: '_!&_'.