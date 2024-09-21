import { Map } from '../../Base/Map/Type';
import { $empty } from '../../Base/Map/empty';
import { $set } from '../../Base/Map/set';
import { List } from '../../Base/List/Type';
import { $foldr } from '../../Base/List/foldr';
import { Pair } from '../../Base/Pair/Type';
import { Bits } from '../../Base/Bits/Type';

// Converts a list of key-value pairs to a Map.
// - pairs: A list of key-value pairs.
// = A Map containing all the key-value pairs from the input list.
export const $from_list = <A>(pairs: List<Pair<Bits, A>>): Map<A> => {
  const insert = (pair: Pair<Bits, A>, m: Map<A>): Map<A> => {
    return $set(m, pair[0], pair[1]);
  };
  return $foldr(insert, $empty(), pairs);
};

export const from_list = <A>(pairs: List<Pair<Bits, A>>) => $from_list(pairs);
