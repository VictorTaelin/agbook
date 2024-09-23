import { Parser } from '../../Base/Parser/Type';
import { State } from '../../Base/Parser/State';
import { Reply } from '../../Base/Parser/Reply';
import { Result, $Done, $Fail } from '../../Base/Result/Type';
import { Error } from '../../Base/Parser/Error';

// Alternative operator
export const $alternative = <A>(p: Parser<A>, q: Parser<A>): Parser<A> => (s: State): Result<Reply<A>, Error> => {
  const result = p(s);
  switch (result.$) {
    case 'Done':
      return result;
    case 'Fail':
      return q(s);
  }
};

export const alternative = <A>(p: Parser<A>) => (q: Parser<A>) => $alternative(p, q);

// NOTE: Operator '_<|>_' is represented as 'alternative'.
