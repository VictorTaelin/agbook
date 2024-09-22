// Represents an IO operation that, when executed, produces a value of type A.
export type IO<A> = () => Promise<A>;

// NOTE: IO is represented as a function that returns a Promise.
// This allows us to handle asynchronous operations in a way that's similar to Agda's IO.
// The function wrapper makes the IO operation lazy, only executing when called.

// NOTE: No direct equivalent for the GHC-specific COMPILE pragma in TypeScript.
// The FOREIGN GHC pragma is also not applicable in TypeScript.

// NOTE: For Text I/O operations, we use the built-in String type in TypeScript,
// which is equivalent to Text in Haskell for most purposes.
