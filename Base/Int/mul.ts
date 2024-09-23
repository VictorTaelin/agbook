import { Int, $Pos, $NegSuc } from '../../Base/Int/Type';
import { Nat, $Succ } from '../../Base/Nat/Type';
import { $mul as $nat_mul } from '../../Base/Nat/mul';
import { $add } from '../../Base/Nat/add';

// Multiplication of integers.
// - x: The 1st integer.
// - y: The 2nd integer.
// = The product of x and y.
export const $$mul = (x: Int, y: Int): Int => {
  if (x >= 0n && y >= 0n) {
    return $Pos($nat_mul(x, y));
  } else if (x < 0n && y < 0n) {
    return $Pos($nat_mul((-x - 1n), (-y - 1n)));
  } else if (x === 0n || y === 0n) {
    return 0n;
  } else if (x > 0n && y < 0n) {
    var m = x - 1n;
    var n = -y - 1n;
    return $NegSuc($add($add(m, n), $nat_mul(m, n)));
  } else { // x < 0 && y > 0
    var m = -x - 1n;
    var n = y - 1n;
    return $NegSuc($add($add(m, n), $nat_mul(m, n)));
  }
};

// NOTE: Using native BigInt multiplication for efficiency.
export const $mul = (x: Int, y: Int): Int => x * y;
export const  mul = (x: Int) => (y: Int) => x * y;

// NOTE: Operator '_*_' omitted.