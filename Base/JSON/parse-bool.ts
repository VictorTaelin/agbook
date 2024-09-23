import { JSON, $JBool } from '../../Base/JSON/Type';
import { Parser } from '../../Base/Parser/Type';
import { $bind, $_seq_ } from '../../Base/Parser/Monad/bind';
import { $consume } from '../../Base/Parser/consume';
import { $pure } from '../../Base/Parser/Monad/pure';
import { $skip_spaces } from '../../Base/Parser/skip-spaces';
import { $alternative } from '../../Base/Parser/alternative';
import { Bool, $True, $False } from '../../Base/Bool/Type';

// Parses a JSON boolean value.
// - Skips any leading whitespace.
// - Consumes either "true" or "false" string.
// - Returns a JBool JSON value.
export const $parse_bool: Parser<JSON> = (state) => 
  $bind($skip_spaces, () => 
    $bind(
      $alternative(
        $bind($consume("true"), () => $pure($True)),
        $bind($consume("false"), () => $pure($False))
      ),
      (b: Bool) => $pure($JBool(b))
    )
  )(state);

export const parse_bool: Parser<JSON> = (state) => $parse_bool(state);