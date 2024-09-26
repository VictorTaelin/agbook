import { Pair } from '../../Base/Pair/Pair';

// Sets the first element of a pair to a new value.
// - z: The new value for the first element.
// - pair: The original pair.
// = A new pair with the first element replaced by z.
export const $set_fst = <C, A, B>(z: C, pair: Pair<A, B>): Pair<C, B> => {
  const [_, y] = pair;
  return [z, y];
};

export const set_fst = <C, A, B>(z: C) => (pair: Pair<A, B>) => $set_fst(z, pair);