// Represents a computation that may succeed with a value or fail with an error.
// - A: The type of the successful result.
// - E: The type of the error.
export type Result<A, E>
  = { $: 'Done', value: A }
  | { $: 'Fail', error: E };

export const $Done = <A, E>(value: A): Result<A, E> => ({ $: 'Done', value });
export const  Done = <A, E>(value: A) => $Done<A, E>(value);

export const $Fail = <A, E>(error: E): Result<A, E> => ({ $: 'Fail', error });
export const  Fail = <A, E>(error: E) => $Fail<A, E>(error);
