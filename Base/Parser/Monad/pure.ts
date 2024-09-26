import { Parser } from '../../../Base/Parser/Parser';
import { $MkReply } from '../../../Base/Parser/Reply';
import { State } from '../../../Base/Parser/State';
import { $Done } from '../../../Base/Result/Result';

// Creates a parser that always succeeds with the given value without consuming any input
export const $pure = <A>(x: A): Parser<A> => (s: State) => $Done($MkReply(s, x));
export const  pure = <A>(x: A) => $pure(x);
