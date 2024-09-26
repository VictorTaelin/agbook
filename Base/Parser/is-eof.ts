import { Bool } from '../../Base/Bool/Bool';
import { Parser } from '../../Base/Parser/Parser';
import { State } from '../../Base/Parser/State';
import { $MkReply } from '../../Base/Parser/Reply';
import { $Done } from '../../Base/Result/Result';
import { $is_empty } from '../../Base/String/is-empty';

// Checks if the parser has reached the end of the input.
// Returns True if at the end of input, False otherwise.
export const $is_eof: Parser<Bool> = (s: State) => {
  var input  = s.input;
  var result = $is_empty(input);
  return $Done($MkReply(s, result));
};

export const is_eof: Parser<Bool> = $is_eof;
