import { IO } from '../../../Base/IO/IO';

// Lifts a pure value into the IO monad.
// 1st: The value to lift.
// = An IO action that returns the given value.
export const $pure = <A>(x: A): IO<A> => () => Promise.resolve(x);
export const  pure = <A>(x: A): IO<A> => $pure(x);

// NOTE: We're using a function that returns Promise.resolve to create a lazy IO action,
// which is our representation of IO in TypeScript.