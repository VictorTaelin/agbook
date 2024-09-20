import { Pair } from '../../Base/Pair/Type';

// Sets the second element of a pair to a new value.
// - z: The new value for the second element.
// - pair: The original pair.
// = A new pair with the same first element and z as the second element.
export const $set_snd = <A, B, C>(z: C, pair: Pair<A, B>): Pair<A, C> => {
  const [x, _] = pair;
  return [x, z];
};

export const set_snd = <A, B, C>(z: C) => (pair: Pair<A, B>) => $set_snd(z, pair);
