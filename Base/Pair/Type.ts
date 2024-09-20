// NOTE: in TypeScript, we represent Sigmas as simple pairs.
// When B depends on A, we just create a Sigma<A,any> instead.

// Dependent pair type (Sigma type)
export type Sigma<A, B> = [A, B];

// Constructor for Sigma
export const $Sigma = <A, B>(fst: A, snd: B): Sigma<A, B> => [fst, snd];
export const  Sigma = <A, B>(fst: A) => (snd: B) => $Sigma(fst, snd);

// Accessor functions
export const fst = <A, B>([fst, _]: Sigma<A, B>): A => fst;
export const snd = <A, B>([_, snd]: Sigma<A, B>): B => snd;

// Σ as a synonym for Sigma
export const Σ = Sigma;

// Simple pair type
export type Pair<A, B> = [A, B];

// Constructor for Pair
export const $Pair = <A, B>(fst: A, snd: B): Pair<A, B> => [fst, snd];
export const  Pair = <A, B>(fst: A) => (snd: B) => $Pair(fst, snd);
