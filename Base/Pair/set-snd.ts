import { Pair, $Pair } from '../../Base/Pair/Type';

export const $set_snd = <A, B, C>(z: C, pair: Pair<A, B>): Pair<A, C> => {
  const [x, _] = pair;
  return $Pair(x, z);
};

export const set_snd = <A, B, C>(z: C) => (pair: Pair<A, B>) => $set_snd(z, pair);
