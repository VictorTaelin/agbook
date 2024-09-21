import { IO } from '../../../Base/IO/Type';

// Sequential composition of IO actions
// - m1: The first IO action to be performed
// - m2: The second IO action to be performed
// = An IO action that performs m1 and then m2, discarding the result of m1
export const $seq = <A, B>(m1: IO<A>, m2: IO<B>): IO<B> => 
  () => m1().then(() => m2());

export const seq = <A, B>(m1: IO<A>) => (m2: IO<B>) => $seq(m1, m2);

// Bind operation for IO
export const $bind = <A, B>(ma: IO<A>, f: (a: A) => IO<B>): IO<B> =>
  () => ma().then(a => f(a)());

export const bind = <A, B>(ma: IO<A>) => (f: (a: A) => IO<B>) => $bind(ma, f);

// Infix operators (not directly usable in TypeScript, but kept for reference)
export const _bind_ = bind;
export const _seq_ = seq;

// NOTE: In TypeScript, we can't define custom infix operators.
// The `>>=` and `>>` operators from Agda are represented by `bind` and `seq` functions respectively.
// Users should use these functions directly instead of infix notation.

// NOTE: The COMPILE GHC pragma is not applicable in TypeScript.
// The COMPILE JS pragma is implemented directly in the TypeScript code above.
