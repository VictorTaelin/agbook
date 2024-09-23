import { Nat } from '../../Base/Nat/Type';

// Represents integer numbers using BigInt
export type Int = bigint;

// Constructs a positive integer from a natural number
export const $Pos = (n: Nat): Int => n;
export const  Pos = (n: Nat): Int => $Pos(n);

// Constructs a negative integer from a natural number
// NegSuc n represents -(n + 1)
export const $NegSuc = (n: Nat): Int => -(n + 1n);
export const  NegSuc = (n: Nat): Int => $NegSuc(n);

// NOTE: Using native BigInt to represent Int for efficiency.
// The original Agda constructors are preserved as functions.
