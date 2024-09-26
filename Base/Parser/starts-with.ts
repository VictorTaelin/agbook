import { Bool } from '../../Base/Bool/Bool';
import { Parser } from '../../Base/Parser/Parser';
import { State } from '../../Base/Parser/State';
import { $MkReply } from '../../Base/Parser/Reply';
import { $Done } from '../../Base/Result/Result';
import { String } from '../../Base/String/String';
import { $starts_with as string_starts_with } from '../../Base/String/starts-with';

// Checks if the input starts with the given string.
// Returns True if the input starts with the given string, False otherwise.
// Does not consume any input.
export const $starts_with = (prefix: String): Parser<Bool> => (s: State) => {
  const input  = s.input;
  const result = string_starts_with(input, prefix);
  return $Done($MkReply(s, result));
};

export const starts_with = (prefix: String) => $starts_with(prefix);
