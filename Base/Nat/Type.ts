export type Nat = bigint;

export const $Zero: Nat = 0n;
export const  Zero: Nat = 0n;

export const $Succ = (n: Nat): Nat => 1n + n;
export const  Succ = (n: Nat) => 1n + n;

// NOTE: using native BigInt to represent Nat.
