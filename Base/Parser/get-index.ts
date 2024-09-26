import { Parser } from '../../Base/Parser/Parser';
import { Nat } from '../../Base/Nat/Nat';
import { $Done } from '../../Base/Result/Result';
import { $MkReply } from '../../Base/Parser/Reply';

export const $get_index: Parser<Nat> = (s) => $Done($MkReply(s, s.index));
export const  get_index: Parser<Nat> = $get_index;
