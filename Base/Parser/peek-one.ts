import { Char } from '../../Base/Char/Type';
import { Maybe } from '../../Base/Maybe/Type';
import { Reply, $MkReply } from '../../Base/Parser/Reply';
import { State } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { Result, $Done } from '../../Base/Result/Type';
import { $head } from '../../Base/String/head';

// Peeks at the next character in the input without consuming it.
// Returns a Maybe Char wrapped in a Parser result.
export const $peek_one: Parser<Maybe<Char>> = (s: State): Result<Reply<Maybe<Char>>, never> => {
  return $Done($MkReply(s, $head(s.input)));
};

export const peek_one: Parser<Maybe<Char>> = (s: State) => $peek_one(s);
