import { Char } from '../../Base/Char/Type';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $bind, $seq } from '../../Base/Parser/Monad/bind';
import { $pure } from '../../Base/Parser/Monad/pure';
import { Parser } from '../../Base/Parser/Type';
import { $consume } from '../../Base/Parser/consume';
import { $parse_char } from '../../Base/Parser/parse-char';
import { String } from '../../Base/String/Type';
import { $from_list } from '../../Base/String/from-list';

// Helper function to parse multiple characters
const $parse_chars: Parser<List<Char>> = 
  $bind($parse_char, (c: Char) => {
    if (c === '"') {
      return $pure($Nil);
    } else {
      return (
        $bind($parse_chars, (cs: List<Char>) => 
        $pure($Cons(c, cs))));
    }
  });

// Parses a quoted string: "hello\nworld" etc.
export const $parse_string: Parser<String> = 
  $bind($seq($consume('"'), $parse_chars), (chars: List<Char>) => 
  $pure($from_list(chars)));

export const parse_string: Parser<String> = $parse_string;
