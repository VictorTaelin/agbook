import { Pair, $Pair } from '../../Base/Pair/Type';

export const $set_fst = <A, B, C>(z: C, pair: Pair<A, B>): Pair<C, B> => {
  var [_, y] = pair;
  return $Pair(z, y);
};

export const set_fst = <A, B, C>(z: C) => (pair: Pair<A, B>) => $set_fst(z, pair);
