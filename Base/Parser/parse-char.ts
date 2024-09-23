import { Bool } from '../../Base/Bool/Type';
import { Char } from '../../Base/Char/Type';
import { $eq } from '../../Base/Char/eq';
import { $from_nat } from '../../Base/Char/from-nat';
import { $is_hex_digit } from '../../Base/Char/is-hex-digit';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { Nat } from '../../Base/Nat/Type';
import { Parser } from '../../Base/Parser/Type';
import { $advance_one } from '../../Base/Parser/advance-one';
import { $bind, $seq } from '../../Base/Parser/Monad/bind';
import { $consume } from '../../Base/Parser/consume';
import { $fail } from '../../Base/Parser/fail';
import { $pure } from '../../Base/Parser/Monad/pure';
import { $take_while } from '../../Base/Parser/take-while';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';
import { $from_char } from '../../Base/String/from-char';
import { $to_nat_base } from '../../Base/String/to-nat-base';

// Parses a unicode escape sequence (e.g., \u{1F600})
export const $parse_unicode_escape: Parser<Char> =
  $bind($seq($consume("{"), $take_while($is_hex_digit)), (digits: String) =>
  $bind($consume("}"), () => {
    const n = $to_nat_base(16n, digits);
    switch (n.$) {
      case 'Some':
        return $pure($from_nat(n.value));
      case 'None':
        return $fail("Invalid hexadecimal number in Unicode escape");
    }
  }));

// Parses an escape sequence
export const $parse_escape_sequence: Parser<Char> =
  $bind($advance_one, (mc: Maybe<Char>) => {
    switch (mc.$) {
      case 'Some':
        switch (mc.value) {
          case 'n' : return $pure('\n');
          case 'r' : return $pure('\r');
          case 't' : return $pure('\t');
          case '\\': return $pure('\\');
          case '\'': return $pure('\'');
          case '"' : return $pure('"');
          case 'u' : return $parse_unicode_escape;
          default  : return $fail($append("Invalid escape character: ", $from_char(mc.value)));
        }
      case 'None':
        return $fail("Unexpected end of input in escape sequence");
    }
  });

// Parses a single character, including escape sequences
export const $parse_char: Parser<Char> =
  $bind($advance_one, (mc: Maybe<Char>) => {
    switch (mc.$) {
      case 'Some':
        return $eq(mc.value, '\\') ? $parse_escape_sequence : $pure(mc.value);
      case 'None':
        return $fail("Unexpected end of input");
    }
  });

export const parse_char: Parser<Char> = $parse_char;
