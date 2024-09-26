import { BitMap } from './Type';
import { $empty } from './empty';
import { $set } from './set';
import { List } from '../List/List';
import { $foldr } from '../List/foldr';
import { Pair } from '../Pair/Pair';
import { Bits } from '../Bits/Bits';

// Converts a list of key-value pairs to a BitMap.
// - pairs: A list of key-value pairs.
// = A BitMap containing all the key-value pairs from the input list.
export const $from_list = <A>(pairs: List<Pair<Bits, A>>): BitMap<A> => {
  const insert = (pair: Pair<Bits, A>, m: BitMap<A>): BitMap<A> => {
    return $set(m, pair[0], pair[1]);
  };
  return $foldr(insert, $empty(), pairs);
};

export const from_list = <A>(pairs: List<Pair<Bits, A>>) => $from_list(pairs);
