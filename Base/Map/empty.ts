import { Map, $Leaf } from '../../Base/Map/Type';

// Creates an empty Map.
// = An empty Map.
export const $empty = <A>(): Map<A> => $Leaf;
export const  empty = <A>() => $empty<A>();
