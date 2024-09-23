import { Bool } from '../../Base/Bool/Type';
import { Parser } from '../../Base/Parser/Type';
import { State } from '../../Base/Parser/State';
import { $MkReply } from '../../Base/Parser/Reply';
import { $Done } from '../../Base/Result/Type';
import { $is_empty } from '../../Base/String/is-empty';

// Checks if the parser has reached the end of the input.
// Returns True if at the end of input, False otherwise.
export const $is_eof: Parser<Bool> = (s: State) => {
  var input  = s.input;
  var result = $is_empty(input);
  return $Done($MkReply(s, result));
};

export const is_eof: Parser<Bool> = $is_eof;
