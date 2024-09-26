import { $merge as $tree_merge } from '../../Base/BinTree/merge';
import { $id } from '../Function/id';
import { BitMap } from './Type';
import { Maybe } from '../Maybe/Maybe';

// Merges two Maps, giving priority to values in the second BitMap when there are conflicts.
// - m1: The first BitMap to merge.
// - m2: The second BitMap to merge (takes priority on conflicts).
// = A new BitMap containing all key-value pairs from both input Maps.
export const $merge = <A>(m1: BitMap<A>, m2: BitMap<A>): BitMap<A> => 
  $tree_merge($id, $id, (_x: Maybe<A>, y: Maybe<A>) => y, m1, m2);

export const merge = <A>(m1: BitMap<A>) => (m2: BitMap<A>) => $merge(m1, m2);
