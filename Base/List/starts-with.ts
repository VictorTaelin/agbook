import { Eq } from '../../Base/Trait/Eq';
import { Bool } from '../../Base/Bool/Bool';
import { $and } from '../../Base/Bool/and';
import { List } from '../../Base/List/List';
import { $eq as $list_eq } from '../../Base/List/eq';
import { $length } from '../../Base/List/length';
import { $take } from '../../Base/List/take';
import { $eq as $nat_eq } from '../../Base/Nat/eq';

// Checks if one list starts with another list.
// - prefix: The potential prefix list.
// - xs: The list to check against.
// = True if xs starts with prefix, False otherwise.
export const $starts_with = <A>(eq_a: Eq<A>) => (prefix: List<A>, xs: List<A>): Bool => {
  const prefix_length = $length(prefix);
  const xs_prefix = $take(prefix_length, xs);
  return $and(
    $list_eq(eq_a)(xs_prefix, prefix),
    $nat_eq($length(xs_prefix), prefix_length)
  );
};

export const starts_with = <A>(eq_a: Eq<A>) => (prefix: List<A>) => (xs: List<A>): Bool =>
  $starts_with(eq_a)(prefix, xs);
