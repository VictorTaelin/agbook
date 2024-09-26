import { List, $Nil, $Cons } from '../../Base/List/List';
import { Parser } from '../../Base/Parser/Parser';
import { State } from '../../Base/Parser/State';
import { Reply } from '../../Base/Parser/Reply';
import { Result, $Done, $Fail } from '../../Base/Result/Result';
import { Error } from '../../Base/Parser/Error';
import { $bind } from '../../Base/Parser/Monad/bind';
import { $pure } from '../../Base/Parser/Monad/pure';

// Applies a parser repeatedly until it fails, collecting the results in a list
// - p: The parser to apply repeatedly
// = A new parser that returns a list of all successful parses
export const $parse_many = <A>(p: Parser<A>): Parser<List<A>> => 
  (s: State): Result<Reply<List<A>>, Error> => {
    // Helper function that recursively applies the parser and accumulates results
    // - acc: The accumulated list of successful parses
    // = A parser that continues parsing and accumulating results
    const go = (acc: List<A>): Parser<List<A>> =>
      $bind(p, (x: A) => go($Cons(x, acc)));

    // Apply the recursive parser starting with an empty list
    const result = go($Nil)(s);
    switch (result.$) {
      case 'Done':
        // If parsing succeeds, return the accumulated list
        // Note: The list is in reverse order of parsing
        return $Done({
          ...result.value,
          value: result.value.value
        });
      case 'Fail':
        // If parsing fails, return an empty list (as we've parsed everything we could)
        return $pure($Nil)(s);
    }
  };

// Non-curried version of $parse_many for easier usage
export const parse_many = <A>(p: Parser<A>) => $parse_many(p);
