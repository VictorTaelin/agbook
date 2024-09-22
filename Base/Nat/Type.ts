// Represents natural numbers using BigInt
export type Nat = bigint;

export const $Zero: Nat = 0n;
export const  Zero: Nat = $Zero;

export const $Succ = (n: Nat): Nat => 1n + n;
export const  Succ = (n: Nat): Nat => $Succ(n);

// NOTE: Using native BigInt to represent Nat for efficiency.
// The original Agda constructors are preserved as functions.