// A polymorphic List with two constructors:
// - [] : The empty list.
// - _::_ : Appends an element to a list.
export type List<A>
  = { $: '[]' }
  | { $: '::', head: A, tail: List<A> };

export const $Nil = { $: '[]' };
export const  Nil = $Nil;

export const $Cons = <A>(head: A, tail: List<A>): List<A> => ({ $: '::', head, tail });
export const  Cons = <A>(head: A) => (tail: List<A>) => $Cons(head, tail);

// NOTE: Constructor '[]' renamed to 'Nil'.
// NOTE: Constructor '_::_' renamed to 'Cons'.