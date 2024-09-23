import { $merge as $tree_merge } from '../../Base/Tree/merge';
import { $id } from '../../Base/Function/id';
import { Map } from '../../Base/Map/Type';
import { Maybe } from '../../Base/Maybe/Type';

// Merges two Maps, giving priority to values in the second Map when there are conflicts.
// - m1: The first Map to merge.
// - m2: The second Map to merge (takes priority on conflicts).
// = A new Map containing all key-value pairs from both input Maps.
export const $merge = <A>(m1: Map<A>, m2: Map<A>): Map<A> => 
  $tree_merge($id, $id, (_x: Maybe<A>, y: Maybe<A>) => y, m1, m2);

export const merge = <A>(m1: Map<A>) => (m2: Map<A>) => $merge(m1, m2);
