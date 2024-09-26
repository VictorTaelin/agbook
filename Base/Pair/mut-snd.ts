import { Pair } from '../../Base/Pair/Pair';

export const $mut_snd = <A, B, C>(f: (b: B) => C, pair: Pair<A, B>): Pair<A, C> => {
  const [x, y] = pair;
  return [x, f(y)];
};

export const mut_snd = <A, B, C>(f: (b: B) => C) => (pair: Pair<A, B>) => $mut_snd(f, pair);

// NOTE: The function name is changed from 'mut-snd' to 'mut_snd' to comply with TypeScript naming conventions.
