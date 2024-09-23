import { List } from '../../../Base/List/Type';

// Represents a potentially infinite list of elements.
// - A: The type of elements in the Omega.
// = A record containing a List A, which can be thought of as a prefix of an infinite list.
export type Omega<A> = {
  $: 'MkOmega',
  run_omega: List<A>
};

export const $MkOmega = <A>(run_omega: List<A>): Omega<A> => ({
  $: 'MkOmega',
  run_omega
});

export const MkOmega = <A>(run_omega: List<A>) => $MkOmega(run_omega);

export const run_omega = <A>(omega: Omega<A>): List<A> => omega.run_omega;