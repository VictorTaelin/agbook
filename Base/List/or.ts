import { List } from '../../Base/List/List';
import { Bool, $False } from '../../Base/Bool/Bool';
import { $foldr } from '../../Base/List/foldr';
import { $or as bool_or } from '../../Base/Bool/or';

// Performs the boolean "or" operation between all elements of a list.
// - xs: The input list of boolean values.
// = True if any element is True, False otherwise.
export const $or = (xs: List<Bool>): Bool => $foldr(bool_or, $False, xs);
export const  or = (xs: List<Bool>) => $or(xs);
