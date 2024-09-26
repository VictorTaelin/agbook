import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';

export interface Eq<A> {
  eq: (a: A, b: A) => Bool;
  neq: (a: A, b: A) => Bool;
}

export const $eq = <A>(eq_a: Eq<A>, a: A, b: A): Bool => eq_a.eq(a, b);
export const  eq = <A>(eq_a: Eq<A>) => (a: A) => (b: A): Bool => eq_a.eq(a, b);

export const $neq = <A>(eq_a: Eq<A>, a: A, b: A): Bool => eq_a.neq(a, b);
export const  neq = <A>(eq_a: Eq<A>) => (a: A) => (b: A): Bool => eq_a.neq(a, b);

// NOTE: Operators omitted: '_==_' and '_!=_'.

export const $make_eq = <A>(eq_impl: (a: A, b: A) => Bool): Eq<A> => ({
  eq: eq_impl,
  neq: (a: A, b: A) => $not(eq_impl(a, b))
});

export const make_eq = <A>(eq_impl: (a: A) => (b: A) => Bool): Eq<A> => 
  $make_eq((a: A, b: A) => eq_impl(a)(b));
