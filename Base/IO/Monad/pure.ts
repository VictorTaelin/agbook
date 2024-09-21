import { IO } from '../../../Base/IO/Type';

// pure: Lifts a value into the IO monad
export const $pure = <A>(x: A): IO<A> => () => Promise.resolve(x);
export const  pure = <A>(x: A) => $pure(x);

// NOTE: This implementation matches the JS COMPILE pragma in the Agda code.
// It creates an IO action (a function) that, when executed, immediately resolves to the given value.
