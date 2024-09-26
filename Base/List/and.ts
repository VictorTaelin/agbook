import { List } from '../../Base/List/List';
import { Bool, $True } from '../../Base/Bool/Bool';
import { $foldr } from '../../Base/List/foldr';
import { $and as bool_and } from '../../Base/Bool/and';

// Performs the boolean "and" operation between all elements of a list.
// - xs: The input list of boolean values.
// = True if all elements are True, False otherwise.
export const $and = (xs: List<Bool>): Bool => $foldr(bool_and, $True, xs);

export const and = (xs: List<Bool>) => $and(xs);
