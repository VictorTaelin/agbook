import { Map, $Leaf } from '../../Base/Map/Type';

// Creates an empty Map.
// = An empty Map.
export const $neo = <A>(): Map<A> => $Leaf;
export const  neo = <A>() => $neo<A>();
