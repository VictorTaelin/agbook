import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { Char } from '../../Base/Char/Type';
import { $eq } from '../../Base/Char/eq';
import { $digit_to_nat } from '../../Base/Char/digit-to-nat';
import { F64 } from '../../Base/F64/Type';
import { $add } from '../../Base/F64/add';
import { $negate } from '../../Base/F64/negate';
import { Int } from '../../Base/Int/Type';
import { $length } from '../../Base/List/length';
import { $map } from '../../Base/List/map';
import { $split_at_element } from '../../Base/List/split-at-element';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { Maybe, $None, $Some } from '../../Base/Maybe/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';
import { $mul } from '../../Base/Nat/mul';
import { $add as nat_add } from '../../Base/Nat/add';
import { $exp } from '../../Base/Nat/exp';
import { Pair } from '../../Base/Pair/Type';
import { $drop } from '../../Base/String/drop';
import { $to_list } from '../../Base/String/to-list';
import { String } from '../../Base/String/Type';

const digits_to_nat = (chars: List<Char>): List<Maybe<Nat>> => $map($digit_to_nat, chars);

// Auxiliary function to accumulate the result
const nat_digits_to_number_helper = (acc: Nat, xs: List<Maybe<Nat>>): Maybe<Nat> => {
  switch (xs.$) {
    case '[]':
      return $Some(acc);
    case '::':
      switch (xs.head.$) {
        case 'None':
          return $None;
        case 'Some':
          return nat_digits_to_number_helper(nat_add($mul(acc, 10n), xs.head.value), xs.tail);
      }
  }
};

// Main function to convert a list of Maybe Nat to Maybe Nat
const nat_digits_to_number = (xs: List<Maybe<Nat>>): Maybe<Nat> => nat_digits_to_number_helper($Zero, xs);

const split_float_string = (char_list: List<Char>): Pair<List<Char>, List<Char>> => 
  $split_at_element((a: Char, b: Char) => $eq(a, b), '.', char_list);

const extract_sign = (s: String): Pair<Bool, String> => {
  const char_list = $to_list(s);
  switch (char_list.$) {
    case '[]':
      return [$False, s];
    case '::':
      if (char_list.head === '-') {
        return [$True, $drop(1n, s)];
      } else if (char_list.head === '+') {
        return [$False, $drop(1n, s)];
      } else {
        return [$False, s];
      }
  }
};

export const $from_string = (s: String): Maybe<F64> => {
  const [is_neg, str] = extract_sign(s);
  const char_list = $to_list(str);
  const [int_part, frac_part] = split_float_string(char_list);
  const len_frac = $length(frac_part);
  const frac_divisor = $exp(10n, len_frac);
  const int_value = nat_digits_to_number(digits_to_nat(int_part));
  const frac_value = nat_digits_to_number(digits_to_nat(frac_part));

  switch (int_value.$) {
    case 'None':
      return $None;
    case 'Some':
      switch (frac_value.$) {
        case 'None':
          return $None;
        case 'Some':
          const abs_value = Number(int_value.value) + (Number(frac_value.value) / Number(frac_divisor));
          return $Some($if_then_else_(is_neg, $negate(abs_value), abs_value));
      }
  }
};

export const from_string = (s: String) => $from_string(s);
