import { Result, $Done, $Fail } from '../../../Base/Result/Result';

// Applies a function to the value inside a Result, if it's successful.
// - ra: The Result value to operate on.
// - fn: The function to apply to the value inside the Result if it's successful.
// = A new Result value resulting from applying fn to the contents of ra if successful,
//   or the original error if ra is a failure.
export const $bind = <A, B, E>(ra: Result<A, E>, fn: (a: A) => Result<B, E>): Result<B, E> => {
  switch (ra.$) {
    case 'Done':
      return fn(ra.value);
    case 'Fail':
      return $Fail(ra.error);
  }
};

export const bind = <A, B, E>(ra: Result<A, E>) => (fn: (a: A) => Result<B, E>) => $bind(ra, fn);

// NOTE: Operator omitted: '_>>=_'.