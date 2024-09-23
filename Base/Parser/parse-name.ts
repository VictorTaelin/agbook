import { $eq as Char_eq } from '../../Base/Char/eq';
import { $eq as String_eq } from '../../Base/String/eq';
import { Bool } from '../../Base/Bool/Type';
import { Char } from '../../Base/Char/Type';
import { $is_alpha } from '../../Base/Char/is-alpha';
import { $is_digit } from '../../Base/Char/is-digit';
import { $bind, bind } from '../../Base/Parser/Monad/bind';
import { $pure } from '../../Base/Parser/Monad/pure';
import { Parser } from '../../Base/Parser/Type';
import { $fail } from '../../Base/Parser/fail';
import { $take_while } from '../../Base/Parser/take-while';
import { String } from '../../Base/String/Type';

// Checks if a character is valid for a name (alphanumeric, underscore, hyphen, or dot)
const $is_name_char = (c: Char): Bool => $is_alpha(c) || $is_digit(c) || Char_eq(c, '_') || Char_eq(c, '-') || Char_eq(c, '.');

// Parses a name from the input.
// A name consists of alphanumeric characters, underscores, hyphens, and dots.
export const $parse_name: Parser<String> =
  $bind($take_while($is_name_char), (name: String) => {
    if (String_eq(name, "")) {
      return $fail("Expected a name");
    } else {
      return $pure(name);
    }
  });

export const parse_name = $parse_name;
