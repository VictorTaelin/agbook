import { Parser } from '../../../Base/Parser/Type';
import { State } from '../../../Base/Parser/State';
import { Reply } from '../../../Base/Parser/Reply';
import { Result, $Fail } from '../../../Base/Result/Type';
import { $case_of_ } from '../../../Base/Function/case';
import { Error } from '../../../Base/Parser/Error';

// Binds two parsers together
export const $bind = <A, B>(p: Parser<A>, f: (a: A) => Parser<B>): Parser<B> => 
  (s: State): Result<Reply<B>, Error> => 
    $case_of_(p(s), (result: Result<Reply<A>, Error>) => {
      switch (result.$) {
        case 'Done':
          return f(result.value.value)(result.value.state);
        case 'Fail':
          return $Fail(result.error);
      }
    });

export const bind = <A, B>(p: Parser<A>) => (f: (a: A) => Parser<B>) => $bind(p, f);

// Sequencing of parsers, discarding the result of the first parser
export const $seq = <A, B>(p: Parser<A>, q: Parser<B>): Parser<B> => 
  $bind(p, (_: A) => q);

export const seq = <A, B>(p: Parser<A>) => (q: Parser<B>) => $seq(p, q);

// Infix operator equivalents
export const $_bind_ = $bind;
export const  _bind_ = bind;

export const $_seq_ = $seq;
export const  _seq_ = seq;

// NOTE: Infix operators are not supported in TypeScript, so we use function names instead.
// Use these as: $_bind_(parserA, (a) => parserB)
// and: $_seq_(parserA, parserB)