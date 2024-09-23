import { Parser } from '../../Base/Parser/Type';
import { Nat } from '../../Base/Nat/Type';
import { $Done } from '../../Base/Result/Type';
import { $MkReply } from '../../Base/Parser/Reply';

export const $get_index: Parser<Nat> = (s) => $Done($MkReply(s, s.index));
export const  get_index: Parser<Nat> = $get_index;
