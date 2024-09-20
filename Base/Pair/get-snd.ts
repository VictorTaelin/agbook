import { Sigma, snd } from '../../Base/Pair/Type';

// Gets the second element of a dependent pair (Sigma type)
// - p: The Sigma pair
// = The second element of the pair
export const $get_snd = <A, B>(p: Sigma<A, B>): B => p[1];
export const  get_snd = <A, B>(p: Sigma<A, B>) => p[1];
