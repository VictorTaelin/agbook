import { Bits } from '../../Base/Bits/Bits';
import { $inc } from '../../Base/Bits/inc';
import { $not } from '../../Base/Bits/not';
import { Int } from '../../Base/Int/Int';
import { $to_bits as $nat_to_bits } from '../../Base/Nat/to-bits';

export const $to_bits = (n: Int): Bits => {
  if (n >= 0n) {
    return $nat_to_bits(n);
  } else {
    return $inc($not($nat_to_bits(-n - 1n)));
  }
};

export const to_bits = (n: Int) => $to_bits(n);
