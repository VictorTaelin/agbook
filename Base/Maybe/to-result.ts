import { Maybe } from '../../Base/Maybe/Maybe';
import { Result, $Done, $Fail } from '../../Base/Result/Result';

export const $to_result = <A, B>(maybe: Maybe<A>, default_error: B): Result<A, B> => {
  switch (maybe.$) {
    case 'Some':
      return $Done(maybe.value);
    case 'None':
      return $Fail(default_error);
  }
};

export const to_result = <A, B>(maybe: Maybe<A>) => (default_error: B) => $to_result(maybe, default_error);