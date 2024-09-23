import { String } from '../../../../Base/String/Type';
import { State, $MkState } from '../../../../Base/Parser/State';

export const $new = (str: String): State => $MkState(str, 0n);
export const  new = (str: String) => $new(str);