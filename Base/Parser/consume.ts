import { Bool } from '../../Base/Bool/Type';
import { Char } from '../../Base/Char/Type';
import { $case_of_ } from '../../Base/Function/case';
import { List } from '../../Base/List/Type';
import { $length } from '../../Base/List/length';
import { Maybe } from '../../Base/Maybe/Type';
import { Nat } from '../../Base/Nat/Type';
import { $MkError } from '../../Base/Parser/Error';
import { $MkReply } from '../../Base/Parser/Reply';
import { State, $MkState } from '../../Base/Parser/State';
import { Parser } from '../../Base/Parser/Type';
import { $Done, $Fail } from '../../Base/Result/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';
import { $drop } from '../../Base/String/drop';
import { $starts_with } from '../../Base/String/starts-with';
import { $to_list } from '../../Base/String/to-list';
import { Unit, $unit } from '../../Base/Unit/Type';

// Tries to consume a specific string from the input.
// Returns unit if successful.
export const $consume = (target: String): Parser<Unit> => (str: State) => {
  return $case_of_($starts_with(str.input, target), (starts: Bool) => {
    if (starts) {
      var new_index = str.index + BigInt($length($to_list(target)));
      var new_input = $drop($length($to_list(target)), str.input);
      return $Done($MkReply($MkState(new_input, new_index), $unit));
    } else {
      return $Fail($MkError(str.index, $append("Expected ", target)));
    }
  });
};

export const consume = (target: String) => $consume(target);

// NOTE: For efficiency, we can use native string operations
export const $$consume = (target: String): Parser<Unit> => (str: State) => {
  if (str.input.startsWith(target)) {
    var new_index = str.index + BigInt(target.length);
    var new_input = str.input.slice(target.length);
    return $Done($MkReply($MkState(new_input, new_index), $unit));
  } else {
    return $Fail($MkError(str.index, `Expected ${target}`));
  }
};