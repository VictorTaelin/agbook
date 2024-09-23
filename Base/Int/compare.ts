import { Ordering, $LT, $EQ, $GT } from '../../Base/Ordering/Type';
import { Int } from '../../Base/Int/Type';
import { $compare as compare_nat } from '../../Base/Nat/compare';

// Compares two integers.
// - m: The first integer.
// - n: The second integer.
// = LT if m < n, EQ if m = n, GT if m > n.
export const $$compare = (m: Int, n: Int): Ordering => {
  if (m >= 0n && n >= 0n) {
    return compare_nat(m, n);
  } else if (m < 0n && n < 0n) {
    var result = compare_nat(-m - 1n, -n - 1n);
    switch (result.$) {
      case 'LT': return $GT;
      case 'EQ': return $EQ;
      case 'GT': return $LT;
    }
  } else if (m >= 0n && n < 0n) {
    return $GT;
  } else {
    return $LT;
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $compare = (m: Int, n: Int): Ordering => {
  if (m < n) return $LT;
  if (m > n) return $GT;
  return $EQ;
};

export const compare = (m: Int) => (n: Int) => $compare(m, n);
