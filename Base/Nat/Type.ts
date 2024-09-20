export type Nat = bigint;

export const $Zero: Nat = 0n;
export const  Zero: Nat = 0n;

export const $Succ = (n: Nat): Nat => 1n + n;
export const  Succ = (n: Nat) => $Succ(n);

// NOTE: Using native BigInt to represent Nat.
