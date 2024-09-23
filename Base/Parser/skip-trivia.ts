import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $not } from '../../Base/Bool/not';
import { Char } from '../../Base/Char/Type';
import { $eq } from '../../Base/Char/eq';
import { $is_space } from '../../Base/Char/is-space';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $drop } from '../../Base/List/drop';
import { $length } from '../../Base/List/length';
import { $take_while } from '../../Base/List/take-while';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';
import { Pair, $Pair } from '../../Base/Pair/Type';
import { $MkReply } from '../../Base/Parser/Reply';
import { State, $MkState } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { $Done } from '../../Base/Result/Type';
import { String } from '../../Base/String/Type';
import { $from_list } from '../../Base/String/from-list';
import { $to_list } from '../../Base/String/to-list';

// TODO: replace some recursions by loops

// Checks if a character is a newline
const $is_newline = (c: Char): Bool => $eq(c, '\n');

// Checks if a list of characters starts with "//"
const $is_comment = (cs: List<Char>): Bool => {
  switch (cs.$) {
    case '[]':
      return $False;
    case '::':
      if (cs.head === '/') {
        switch (cs.tail.$) {
          case '[]':
            return $False;
          case '::':
            return cs.tail.head === '/';
        }
      }
      return $False;
  }
};

// Helper function to handle comment skipping
const $skip_comment = (acc: Nat, cs: List<Char>): Pair<Nat, List<Char>> => {
  const com_len = $length($take_while((c: Char) => $not($is_newline(c)), cs));
  const new_acc = $add($add(acc, 2n), com_len); // +2 for "//"
  const rem     = $drop($Succ(com_len), cs); // +1 to consume newline
  return $skip_trivia_go(new_acc, rem);
};

// Auxiliary function for skip-trivia
// Accumulates the number of skipped characters
const $skip_trivia_go = (acc: Nat, cs: List<Char>): Pair<Nat, List<Char>> => {
  switch (cs.$) {
    case '[]':
      return $Pair(acc, $Nil);
    case '::':
      if ($is_space(cs.head)) {
        return $skip_trivia_go($Succ(acc), cs.tail);
      } else if ($is_comment(cs)) {
        return $skip_comment(acc, cs.tail);
      } else {
        return $Pair(acc, cs);
      }
  }
};

// Skips whitespace and comments in the text.
// Returns the number of characters skipped.
export const $skip_trivia: Parser<Nat> = (s: State) => {
  const input      = s.input;
  const chars      = $to_list(input);
  const [skp, rem] = $skip_trivia_go($Zero, chars);
  const new_index  = $add(s.index, skp);
  const new_input  = $from_list(rem);
  return $Done($MkReply($MkState(new_input, new_index), skp));
};

export const skip_trivia: Parser<Nat> = (s: State) => $skip_trivia(s);
