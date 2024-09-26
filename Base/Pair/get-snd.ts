import { Sigma } from '../../Base/Pair/Pair';

// Gets the second element of a Sigma pair
export const $get_snd = <A, B>(pair: Sigma<A, B>): B => pair[1];
export const  get_snd = <A, B>(pair: Sigma<A, B>) => pair[1];
