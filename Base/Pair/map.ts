import { Sigma, $Sigma } from '../../Base/Pair/Type';

export const $map = <A, B, C, D>(
  f: (x: A) => C,
  g: (x: A, y: B) => D,
  pair: Sigma<A, B>
): Sigma<C, D> => {
  var [x, y] = pair;
  return $Sigma(f(x), g(x, y));
};

export const map = <A, B, C, D>(
  f: (x: A) => C
) => (
  g: (x: A, y: B) => D
) => (
  pair: Sigma<A, B>
) => $map(f, g, pair);

// NOTE: Due to TypeScript's limitations with dependent types,
// we've simplified the function signature. The relationship
// between B and D with respect to A and C is not preserved.