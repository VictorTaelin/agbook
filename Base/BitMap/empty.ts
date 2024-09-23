import { BitMap, $Leaf } from './Type';

// Creates an empty BitMap.
// = An empty BitMap.
export const $empty = <A>(): BitMap<A> => $Leaf;
export const  empty = <A>() => $empty<A>();
