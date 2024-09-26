import { List, $Nil } from '../../Base/List/List';
import { $foldr } from '../../Base/List/foldr';
import { $append } from '../../Base/List/append';

// Concatenates a list of lists into a single list.
// - xss: The input list of lists.
// = A new list containing all elements from all inner lists.
export const $concat = <A>(xss: List<List<A>>): List<A> => {
  return $foldr<List<A>, List<A>>($append, $Nil, xss);
};

export const concat = <A>(xss: List<List<A>>) => $concat(xss);
