import { Bool } from '../../Base/Bool/Type';
import { Char } from '../../Base/Char/Type';
import { List } from '../../Base/List/Type';
import { $take_while as List_take_while } from '../../Base/List/take-while';
import { $length } from '../../Base/List/length';
import { $drop } from '../../Base/List/drop';
import { Nat } from '../../Base/Nat/Type';
import { Parser } from '../../Base/Parser/Type';
import { State, $MkState } from '../../Base/Parser/State';
import { Reply, $MkReply } from '../../Base/Parser/Reply';
import { $Done } from '../../Base/Result/Type';
import { String } from '../../Base/String/Type';
import { $from_list } from '../../Base/String/from-list';
import { $to_list } from '../../Base/String/to-list';

// Consumes characters from the input as long as they satisfy the given predicate.
// Returns the consumed string.
export const $take_while = (pred: (c: Char) => Bool): Parser<String> => (s: State) => {
  var input     = s.input;
  var chars     = $to_list(input);
  var consumed  = List_take_while(pred, chars);
  var result    = $from_list(consumed);
  var count     = $length(consumed);
  var new_index = s.index + count; // Using native BigInt addition
  var new_input = $from_list($drop(count, chars));
  return $Done($MkReply($MkState(new_input, new_index), result));
};

export const take_while = (pred: (c: Char) => Bool) => $take_while(pred);
