// Dependent pair type (Sigma type)
export type Sigma<A, B> = [A, any];

// Constructor for Sigma
export const $Sigma = <A, B>(fst: A, snd: B): Sigma<A, B> => [fst, snd];
export const  Sigma = <A, B>(fst: A) => (snd: B) => $Sigma(fst, snd);

// Σ as a synonym for Sigma
export const Σ = Sigma;

// Simple pair type
export type Pair<A, B> = [A, B];

// Constructor for Pair
export const $Pair = <A, B>(fst: A, snd: B): Pair<A, B> => [fst, snd];
export const  Pair = <A, B>(fst: A) => (snd: B) => $Pair(fst, snd);

// NOTE: TypeScript doesn't have a direct equivalent for dependent types,
// so we're using a simplified representation for Sigma and Pair.
// Both are compiled to simple pairs [A, B].
