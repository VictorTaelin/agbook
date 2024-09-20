// A polymorphic List with two constructors:
// - [] : The empty list.
// - _::_ : Appends an element to a list.
export type List<A>
  = { $: '[]' }
  | { $: '::', head: A, tail: List<A> };

export const $Nil: List<never> = { $: '[]' };
export const  Nil: List<never> = $Nil;

export const $Cons = <A>(head: A, tail: List<A>): List<A> => ({ $: '::', head, tail });
export const  Cons = <A>(head: A) => (tail: List<A>) => $Cons(head, tail);

// NOTE: constructor '[]' renamed to 'Nil'.
// NOTE: constructor '_::_' renamed to 'Cons'.
