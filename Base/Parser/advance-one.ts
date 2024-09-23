import { Char } from '../../Base/Char/Type';
import { Maybe, $None, $Some } from '../../Base/Maybe/Type';
import { $Succ } from '../../Base/Nat/Type';
import { $MkReply } from '../../Base/Parser/Reply';
import { State, $MkState } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { $Done } from '../../Base/Result/Type';
import { $uncons } from '../../Base/String/uncons';

// Advances the parser by one character, consuming it.
// Returns the consumed character if successful.
export const $advance_one: Parser<Maybe<Char>> = (state: State) => {
  const result = $uncons(state.input);
  switch (result.$) {
    case 'None':
      return $Done($MkReply(state, $None));
    case 'Some':
      const head = result.value[0];
      const tail = result.value[1];
      return $Done($MkReply($MkState(tail, $Succ(state.index)), $Some(head)));
  }
};

export const advance_one: Parser<Maybe<Char>> = (state: State) => $advance_one(state);
