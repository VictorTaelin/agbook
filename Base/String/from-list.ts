import { List } from '../../Base/List/List';
import { Char } from '../../Base/Char/Char';
import { String } from '../../Base/String/String';

// Converts a list of characters to a string.
// - cs: The input list of characters.
// = A string composed of the characters in the list.
export const $$from_list = (cs: List<Char>): String => {
  switch (cs.$) {
    case '[]':
      return '';
    case '::':
      return cs.head + $$from_list(cs.tail);
  }
};

// NOTE: Using native string concatenation for efficiency.
export const $from_list = (cs: List<Char>): String => {
  var result = '';
  var current = cs;
  while (current.$ === '::') {
    result += current.head;
    current = current.tail;
  }
  return result;
};

export const from_list = (cs: List<Char>) => $from_list(cs);
