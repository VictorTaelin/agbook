import { Maybe, $None, $Some } from '../../Maybe/Type';

// Applies a function to the value inside a Maybe, if it exists.
// - ma: The Maybe value to operate on.
// - fn: The function to apply to the value inside the Maybe.
// = A new Maybe value resulting from applying f to the contents of ma.
export const $bind = <A, B>(ma: Maybe<A>, fn: (a: A) => Maybe<B>): Maybe<B> => {
  switch (ma.$) {
    case 'None':
      return $None;
    case 'Some':
      return fn(ma.value);
  }
};

export const bind = <A, B>(ma: Maybe<A>) => (fn: (a: A) => Maybe<B>) => $bind(ma, fn);

// NOTE: Operator omitted: '_>>=_'.