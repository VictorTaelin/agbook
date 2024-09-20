import { Sigma } from '../../Base/Pair/Type';

// Gets the first element of a Sigma (dependent pair) type.
// - pair: The input Sigma pair.
// = The first element of the pair.
export const $get_fst = <A, B>(pair: Sigma<A, B>): A => pair[0];
export const  get_fst = <A, B>(pair: Sigma<A, B>) => pair[0];
