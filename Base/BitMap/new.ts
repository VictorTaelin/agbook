import { BitMap, $Leaf } from './Type';

// Creates an empty BitMap.
// = An empty BitMap.
export const $neo = <A>(): BitMap<A> => $Leaf;
export const  neo = <A>() => $neo<A>();
