import { Maybe } from '../../Base/Maybe/Type';

// Runs a Maybe monad, returning a default value if it is None.
// - d: The default value to return if ma is None.
// - m: The Maybe value to run.
// = The value inside ma if it's Some, otherwise the default value.
export const $run = <A>(d: A, m: Maybe<A>): A => {
  switch (m.$) {
    case 'None':
      return d;
    case 'Some':
      return m.value;
  }
};

export const run = <A>(d: A) => (m: Maybe<A>) => $run(d, m);
