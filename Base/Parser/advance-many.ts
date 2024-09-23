import { Char } from '../../Base/Char/Type';
import { List } from '../../Base/List/Type';
import { $drop } from '../../Base/List/drop';
import { $take } from '../../Base/List/take';
import { Maybe, $Some } from '../../Base/Maybe/Type';
import { Nat } from '../../Base/Nat/Type';
import { $MkReply } from '../../Base/Parser/Reply';
import { State, $MkState } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { $Done } from '../../Base/Result/Type';
import { String } from '../../Base/String/Type';
import { $from_list } from '../../Base/String/from-list';
import { $to_list } from '../../Base/String/to-list';

// Advances the parser by 'count' characters, consuming them.
// Returns the consumed characters as a Maybe String.
export const $advance_many = (count: Nat): Parser<Maybe<String>> => (s: State) => {
  const input     = s.input;
  const chars     = $to_list(input);
  const consumed  = $take(count, chars);
  const result    = $from_list(consumed);
  const new_index = s.index + count;
  const new_input = $from_list($drop(count, chars));
  return $Done($MkReply($MkState(new_input, new_index), $Some(result)));
};

export const advance_many = (count: Nat) => $advance_many(count);
