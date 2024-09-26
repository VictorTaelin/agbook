import { Nat } from '../../Base/Nat/Nat';
import { List, $Nil, $Cons } from '../../Base/List/List';
import { Bits, $E } from '../../Base/Bits/Bits';
import { $split_at } from '../../Base/Bits/split-at';

// Collects Bits into a list of Bits, each with length `d`.
export const $split_chunks = (d: Nat, bits: Bits): List<Bits> => {
  if (d === 0n) {
    return $Nil;
  }
  if (bits.$ === 'E') {
    return $Nil;
  }
  var split = $split_at(d, bits);
  var collected = split[0];
  var rest = split[1];
  if (rest.$ === 'E') {
    return $Cons(collected, $Nil);
  } else {
    return $Cons(collected, $split_chunks(d, rest));
  }
};

export const split_chunks = (d: Nat) => (bits: Bits) => $split_chunks(d, bits);

// NOTE: This function is marked as TERMINATING in Agda.
// In TypeScript, we don't have a direct equivalent for this annotation,
// so we're implementing it as a regular recursive function.
// Care should be taken to ensure it terminates in all cases.
