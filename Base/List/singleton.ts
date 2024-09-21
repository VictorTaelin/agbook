import { List, $Cons, $Nil } from '../../Base/List/Type';

// Creates a list containing a single element.
// - x: The element to be placed in the list.
// = A new list containing only the given element.
export const $singleton = <A>(x: A): List<A> => $Cons(x, $Nil);
export const  singleton = <A>(x: A) => $singleton(x);

// NOTE: Operator '[_]' omitted as it's not directly translatable to TypeScript.
// Users can use 'singleton' function instead.