import { IO } from '../../../Base/IO/IO';

// Lifts a value into the IO monad.
// - A: The type of the value being lifted.
// - x: The value to lift into IO.
// = An IO action that will produce the value x.
export const $pure = <A>(x: A): IO<A> => () => Promise.resolve(x);
export const  pure = <A>(x: A): IO<A> => $pure(x);

// NOTE: We're using a function that returns Promise.resolve to create a lazy IO action,
// which is our representation of IO in TypeScript.