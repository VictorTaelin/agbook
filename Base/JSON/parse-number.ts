import { JSON, $JNumber } from '../../Base/JSON/Type';
import { Parser } from '../../Base/Parser/Type';
import { $bind, $_bind_ } from '../../Base/Parser/Monad/bind';
import { $consume } from '../../Base/Parser/consume';
import { $pure } from '../../Base/Parser/Monad/pure';
import { $alternative, $_alternative_ } from '../../Base/Parser/alternative';
import { $fail } from '../../Base/Parser/fail';
import { $skip_spaces } from '../../Base/Parser/skip-spaces';
import { $take_while } from '../../Base/Parser/take-while';
import { $is_digit } from '../../Base/Char/is-digit';
import { $from_string } from '../../Base/Float/from-string';
import { $mul } from '../../Base/Float/mul';
import { $exp } from '../../Base/Float/exp';
import { $case_of_ } from '../../Base/Function/case';
import { $append } from '../../Base/String/append';
import { String } from '../../Base/String/Type';
import { $eq } from '../../Base/String/eq';
import { Bool } from '../../Base/Bool/Type';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { Float } from '../../Base/Float/Type';

const $is_empty = (s: String): Bool => $eq(s, "");

// Parses a JSON number value.
// - Skips leading whitespace.
// - Parses an optional minus sign.
// - Parses the integer part.
// - Optionally parses the fractional part.
// - Optionally parses the exponential part.
// = Returns a JNumber JSON value if successful, or fails with an error message.
export const $parse_number: Parser<JSON> = $_bind_($skip_spaces, () =>
  $_bind_($_alternative_($_bind_($consume("-"), () => $pure("-")), $pure("")), (sign: String) =>
    $_bind_($take_while($is_digit), (int_part: String) =>
      $_bind_($_alternative_(
        $_bind_($consume("."), () =>
          $_bind_($take_while($is_digit), (frac: String) =>
            $pure($append(".", frac))
          )
        ),
        $pure("")
      ), (frac_part: String) =>
        $_bind_($_alternative_(
          $_bind_($_alternative_($consume("e"), $consume("E")), () =>
            $_bind_($_alternative_($_alternative_(
              $_bind_($consume("+"), () => $pure("+")),
              $_bind_($consume("-"), () => $pure("-"))
            ), $pure("+")), (exp_sign: String) =>
              $_bind_($take_while($is_digit), (exp_digits: String) =>
                $pure($append(exp_sign, exp_digits))
              )
            )
          ),
          $pure("")
        ), (exp_part: String) => {
          const base_num_str = $append($append(sign, int_part), frac_part);
          return $case_of_($is_empty(int_part), (is_empty: Bool) => {
            if (is_empty) {
              return $fail("Invalid number: no digits in integer part");
            } else {
              return $case_of_($from_string(base_num_str), (base_num_maybe: Maybe<Float>) => {
                switch (base_num_maybe.$) {
                  case 'Some':
                    const base_num = base_num_maybe.value;
                    if (exp_part === "") {
                      return $pure($JNumber(base_num));
                    } else {
                      return $case_of_($from_string(exp_part), (exp_num_maybe: Maybe<Float>) => {
                        switch (exp_num_maybe.$) {
                          case 'Some':
                            const exp_num = exp_num_maybe.value;
                            return $pure($JNumber($mul(base_num, $exp(10.0, exp_num))));
                          case 'None':
                            return $fail($append("Invalid exponent: ", exp_part));
                        }
                      });
                    }
                  case 'None':
                    return $fail($append("Invalid number: ", base_num_str));
                }
              });
            }
          });
        }
      )
    )
  )
);

export const parse_number: Parser<JSON> = $parse_number;

// TSC Error: Base/JSON/parse-number.ts(87,2): error TS1005: ')' expected.
