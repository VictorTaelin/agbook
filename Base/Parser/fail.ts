import { Parser } from '../../Base/Parser/Parser';
import { $MkError } from '../../Base/Parser/Error';
import { State } from '../../Base/Parser/State';
import { $Fail } from '../../Base/Result/Result';
import { String } from '../../Base/String/String';

// Creates a failing parser with the given error message
export const $fail = <A>(msg: String): Parser<A> => (s: State) => $Fail($MkError(s.index, msg));
export const  fail = <A>(msg: String) => $fail<A>(msg);
