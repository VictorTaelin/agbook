import { List } from '../../Base/List/Type';
import { Pair } from '../../Base/Pair/Type';
import { $unzip_with, unzip_with } from '../../Base/List/unzip-with';

// Unzips a list of pairs into two separate lists.
// - xs: The input list of pairs to unzip.
// = A pair of lists, where the first list contains all first elements of the pairs,
//   and the second list contains all second elements of the pairs.
export const $unzip = <A, B>(xs: List<Pair<A, B>>): Pair<List<A>, List<B>> => {
  return $unzip_with((x: Pair<A, B>) => x, xs);
};

export const unzip = <A, B>(xs: List<Pair<A, B>>) => $unzip(xs);