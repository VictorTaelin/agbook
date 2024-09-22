import { Parser } from '../../Base/Parser/Type';
import { State } from '../../Base/Parser/State';
import { Reply } from '../../Base/Parser/Reply';
import { Result, $Done, $Fail } from '../../Base/Result/Type';
import { $case_of_ } from '../../Base/Function/case';

// Alternative operator
export const $alternative = <A>(p: Parser<A>, q: Parser<A>): Parser<A> => 
  (s: State): Result<Reply<A>, any> => 
    $case_of_(p(s), (result: Result<Reply<A>, any>) => {
      switch (result.$) {
        case 'Done':
          return $Done(result.value);
        case 'Fail':
          return q(s);
      }
    });

export const alternative = <A>(p: Parser<A>) => (q: Parser<A>) => $alternative(p, q);

// NOTE: Operator '_<|>_' is represented as 'alternative'.