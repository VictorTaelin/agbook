import { List } from '../../Base/List/Type';
import { Pair } from '../../Base/Pair/Type';
import { $zip_with, zip_with } from '../../Base/List/zip-with';

// Zips two lists into a single list of pairs.
// - xs: The first input list.
// - ys: The second input list.
// = A new list where each element is a pair of corresponding elements from xs and ys.
export const $zip = <A, B>(xs: List<A>, ys: List<B>): List<Pair<A, B>> => 
  $zip_with((a: A, b: B) => [a, b] as Pair<A, B>, xs, ys);

export const zip = <A, B>(xs: List<A>) => (ys: List<B>) => $zip(xs, ys);
