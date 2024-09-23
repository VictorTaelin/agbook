import { Bool, $True, $False } from '../../Base/Bool/Type';
import { String } from '../../Base/String/Type';
import { $starts_with } from '../../Base/String/starts-with';
import { $drop } from '../../Base/String/drop';

// Checks if the first string contains the second string.
// Returns True if str contains substr, False otherwise.
export const $$contains = (str: String, substr: String): Bool => {
  const go = (s: String): Bool => {
    if (s === "") {
      return $False;
    } else {
      if ($starts_with(s, substr)) {
        return $True;
      } else {
        return go($drop(1n, s));
      }
    }
  };
  return go(str);
};

// NOTE: Using native string includes method for efficiency
export const $contains = (str: String, substr: String): Bool => str.includes(substr);
export const  contains = (str: String) => (substr: String): Bool => str.includes(substr);
