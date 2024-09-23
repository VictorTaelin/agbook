import { JSON, $JNull } from '../../Base/JSON/Type';
import { $_bind_, $_seq_ } from '../../Base/Parser/Monad/bind';
import { Parser } from '../../Base/Parser/Type';
import { $consume } from '../../Base/Parser/consume';
import { $pure } from '../../Base/Parser/Monad/pure';
import { $skip_spaces } from '../../Base/Parser/skip-spaces';

// Parses a JSON null value.
// Skips any leading whitespace, consumes the "null" string,
// and returns a JNull JSON value.
export const $parse_null: Parser<JSON> = 
  $_bind_($skip_spaces, () => 
    $_seq_($consume("null"),
      $pure($JNull)
    )
  );

export const parse_null: Parser<JSON> = $parse_null;