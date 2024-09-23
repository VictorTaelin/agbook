import { $if_then_else_ } from '../../Base/Bool/if';
import { Char } from '../../Base/Char/Type';
import { List } from '../../Base/List/Type';
import { $length } from '../../Base/List/length';
import { $take } from '../../Base/List/take';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { Nat } from '../../Base/Nat/Type';
import { $eq } from '../../Base/Nat/eq';
import { $MkReply } from '../../Base/Parser/Reply';
import { State } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { $Done } from '../../Base/Result/Type';
import { String } from '../../Base/String/Type';
import { $from_list } from '../../Base/String/from-list';
import { $to_list } from '../../Base/String/to-list';

// Inspects the next 'count' characters in the text without consuming them.
// Returns a Maybe String containing the peeked characters, or None if there aren't enough characters.
export const $peek_many = (count: Nat): Parser<Maybe<String>> => (s: State) => {
  const chars  = $to_list(s.input);
  const peeked = $take(count, chars);
  const enough = $eq($length(peeked), count);
  const result = $if_then_else_(enough, $Some($from_list(peeked)), $None);
  return $Done($MkReply(s, result));
};

export const peek_many = (count: Nat) => $peek_many(count);

// NOTE: Using a more efficient implementation for performance
export const $$peek_many = (count: Nat): Parser<Maybe<String>> => (s: State) => {
  if (s.input.length >= count) {
    return $Done($MkReply(s, $Some(s.input.slice(0, Number(count)))));
  } else {
    return $Done($MkReply(s, $None));
  }
};
