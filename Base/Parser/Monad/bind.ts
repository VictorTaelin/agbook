import { Parser } from '../../../Base/Parser/Type';
import { State } from '../../../Base/Parser/State';
import { Reply } from '../../../Base/Parser/Reply';
import { Result, $Fail } from '../../../Base/Result/Type';
import { Error } from '../../../Base/Parser/Error';

// Binds two parsers together
export const $bind = <A, B>(p: Parser<A>, f: (a: A) => Parser<B>): Parser<B> => 
  (s: State): Result<Reply<B>, Error> => {
    var result = p(s);
    switch (result.$) {
      case 'Done':
        return f(result.value.value)(result.value.state);
      case 'Fail':
        return $Fail(result.error);
    }
  };

export const bind = <A, B>(p: Parser<A>) => (f: (a: A) => Parser<B>) => $bind(p, f);

// Sequencing of parsers, discarding the result of the first parser
export const $seq = <A, B>(p: Parser<A>, q: Parser<B>): Parser<B> => $bind(p, (_: A) => q);
export const  seq = <A, B>(p: Parser<A>) => (q: Parser<B>) => $seq(p, q);
