import { Char } from '../../Base/Char/Type';
import { Parser } from '../../Base/Parser/Type';
import { $bind, $seq } from '../../Base/Parser/Monad/bind';
import { $pure } from '../../Base/Parser/Monad/pure';
import { $consume } from '../../Base/Parser/consume';
import { $parse_char } from '../../Base/Parser/parse-char';

// Parses a quoted character: 'c' or '\n' etc.
export const $parse_quoted_char: Parser<Char> = 
  $bind($seq($consume("'"), $parse_char), (c: Char) =>
  $bind($consume("'"), () =>
  $pure(c)));

export const parse_quoted_char: Parser<Char> = $parse_quoted_char;
