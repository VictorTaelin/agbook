import { Nat } from '../../Base/Nat/Type';
import { String } from '../../Base/String/Type';
import { Char } from '../../Base/Char/Type';
import { Maybe, Some, None } from '../../Base/Maybe/Type';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $to_list } from '../../Base/String/to-list';
import { $add } from '../../Base/Nat/add';
import { $mul } from '../../Base/Nat/mul';
import { $to_digit } from '../../Base/Char/to-digit';

// Converts a string to a natural number in the given base
export const $to_nat_base = (base: Nat, s: String): Maybe<Nat> => {
  const cs = $to_list(s);
  
  if (cs.$ === '[]') {
    return None;
  } else {
    const go = (cs: List<Char>, acc: Nat): Maybe<Nat> => {
      switch (cs.$) {
        case '[]':
          return Some(acc);
        case '::':
          var digit_result = $to_digit(base, cs.head);
          switch (digit_result.$) {
            case 'Some':
              return go(cs.tail, $add($mul(acc, base), digit_result.value));
            case 'None':
              return None;
          }
      }
    };
    
    return go(cs, 0n);
  }
};

export const to_nat_base = (base: Nat) => (s: String) => $to_nat_base(base, s);
