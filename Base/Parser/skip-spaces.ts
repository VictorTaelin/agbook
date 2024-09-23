import { Char } from '../../Base/Char/Type';
import { $is_space } from '../../Base/Char/is-space';
import { List } from '../../Base/List/Type';
import { $drop } from '../../Base/List/drop';
import { $length } from '../../Base/List/length';
import { $take_while } from '../../Base/List/take-while';
import { Nat } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';
import { $MkReply } from '../../Base/Parser/Reply';
import { State, $MkState } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { $Done } from '../../Base/Result/Type';
import { String } from '../../Base/String/Type';
import { $from_list } from '../../Base/String/from-list';
import { $to_list } from '../../Base/String/to-list';

// Skips spaces in the text.
// Returns the number of spaces skipped.
export const $skip_spaces: Parser<Nat> = (s: State) => {
  var input: String = s.input;
  var chars: List<Char> = $to_list(input);
  var skipped: List<Char> = $take_while($is_space, chars);
  var count: Nat = $length(skipped);
  var new_index: Nat = $add(s.index, count);
  var new_input: String = $from_list($drop(count, chars));
  return $Done($MkReply($MkState(new_input, new_index), count));
};

export const skip_spaces: Parser<Nat> = (s: State) => $skip_spaces(s);
