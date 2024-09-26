import { Bits } from '../../Base/Bits/Bits';
import { $to_nat as $char_to_nat } from '../../Base/Char/to-nat';
import { String } from '../../Base/String/String';
import { $to_list } from '../../Base/String/to-list';
import { List } from '../../Base/List/List';
import { $map } from '../../Base/List/map';
import { $foldl } from '../../Base/List/foldl';
import { Nat } from '../../Base/Nat/Nat';
import { $to_bits } from '../../Base/Nat/to-bits';
import { $xor } from '../../Base/Nat/xor';
import { $exp } from '../../Base/Nat/exp';
import { $mul } from '../../Base/Nat/mul';
import { $div } from '../../Base/Nat/div';
import { $mod } from '../../Base/Nat/mod';
import { $add } from '../../Base/Nat/add';

// FxHash64
// Note: Chars are only actually 21 bits long, so maybe this is bad.
export const $hash = (str: String): Bits => {
  const words = $map($char_to_nat, $to_list(str));
  return $to_bits(fxhash(words));
};

export const hash = (str: String) => $hash(str);

const rotate_left = (n: Nat, shift: Nat, width: Nat): Nat => {
  const lower = $div(n, $exp(2n, width - shift));
  const upper = $mod($mul(n, $exp(2n, shift)), $exp(2n, width));
  return $add(upper, lower);
};

const fxhash_step = (hash: Nat, char: Nat): Nat => {
  const seed = 0x517cc1b727220a95n;
  hash = rotate_left(hash, 5n, 64n);
  hash = $xor(hash, char);
  hash = $mul(hash, seed);
  hash = $mod(hash, $exp(2n, 64n));
  return hash;
};

const fxhash = (ns: List<Nat>): Nat => {
  return $foldl(fxhash_step, 0n, ns);
};