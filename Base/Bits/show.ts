import { Bits } from '../../Base/Bits/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';

export const $show = (b: Bits): String => {
  switch (b.$) {
    case 'E':
      return "e";
    case 'O':
      return $append("0", $show(b.tail));
    case 'I':
      return $append("1", $show(b.tail));
  }
};

export const show = (b: Bits) => $show(b);
