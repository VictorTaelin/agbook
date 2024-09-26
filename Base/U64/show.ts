import { U64 } from '../../Base/U64/U64';
import { String } from '../../Base/String/String';
import { $append } from '../../Base/String/append';
import { $show as nat_show } from '../../Base/Nat/show';
import { $to_nat } from '../../Base/U64/to-nat';

// Converts a U64 to its string representation, appending "U" at the end.
export const $show = (x: U64): String => {
  return $append(nat_show($to_nat(x)), "U");
};

export const show = (x: U64) => $show(x);

// NOTE: Using the composition of $to_nat, nat_show, and string append for the implementation.
