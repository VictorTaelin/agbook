// NOTE: In TypeScript, there are no higher-kinded types, making the Monad
// instance impossible to express precisely. Instead, we use 'any' to
// disable the type system surgically for this specific type.

// Monad interface definition
export interface Monad<M> {
  bind: <A, B>(ma: any, f: (a: A) => any) => any;
  pure: <A>(a: A) => any;
}

// Helper function to use bind with infix notation
export const $bind = <M, A, B>(ma: any, f: (a: A) => any, monad: Monad<M>): any =>
  monad.bind(ma, f);

export const bind = <M, A, B>(ma: any) => (f: (a: A) => any) => (monad: Monad<M>): any =>
  monad.bind(ma, f);

// Helper function to use pure
export const $pure = <M, A>(a: A, monad: Monad<M>): any => monad.pure(a);
export const pure = <M, A>(a: A) => (monad: Monad<M>): any => monad.pure(a);

// Infix operator for sequencing (>>)
export const $seq = <M, A, B>(ma: any, mb: any, monad: Monad<M>): any =>
  monad.bind(ma, (_: A) => mb);

export const seq = <M, A, B>(ma: any) => (mb: any) => (monad: Monad<M>): any =>
  monad.bind(ma, (_: A) => mb);

// NOTE: Infix operators are represented as functions with '$' prefix
// NOTE: Curried versions of operators are represented without prefix
// NOTE: Instance arguments are passed explicitly in TypeScript
// NOTE: Using 'any' type to represent the monadic type M<A> due to lack of higher-kinded types
