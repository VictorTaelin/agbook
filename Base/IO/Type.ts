// Represents an IO action that produces a value of type A
export type IO<A> = () => Promise<A>;

// NOTE: In TypeScript, we represent IO as a function that returns a Promise.
// This allows us to model asynchronous operations in a way that's similar to
// how IO works in Agda, where it represents computations with side effects.
