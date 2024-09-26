import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { String } from '../../Base/String/String';
import { List } from '../../Base/List/List';
import { Char } from '../../Base/Char/Char';
import { $to_list } from '../../Base/String/to-list';

export const $$is_empty = (s: String): Bool => {
  var list = $to_list(s);
  switch (list.$) {
    case '[]':
      return $True;
    case '::':
      return $False;
  }
};

// NOTE: Using native string length check for efficiency.
export const $is_empty = (s: String): Bool => s.length === 0;
export const is_empty = (s: String) => $is_empty(s);
