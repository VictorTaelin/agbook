import { Int, $Pos } from '../../Base/Int/Type';
import { Nat } from '../../Base/Nat/Type';

// Converts a natural number to an integer.
// - n: The natural number to convert.
// = The corresponding integer representation.
export const $from_nat = (n: Nat): Int => $Pos(n);
export const  from_nat = (n: Nat): Int => $from_nat(n);

// NOTE: Since both Nat and Int are represented as BigInt,
// this operation is essentially an identity function.
