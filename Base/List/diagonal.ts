import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $append } from '../../Base/List/append';
import { $foldr } from '../../Base/List/foldr';
import { $zip_cons } from '../../Base/List/zip_cons';

// Helper function to create a striped version of the input list of lists.
// - xss: The input list of lists.
// = A new list of lists where each sublist contains elements from the diagonal.
const $stripe = <A>(xss: List<List<A>>): List<List<A>> => {
  switch (xss.$) {
    case '[]':
      return $Nil;
    case '::':
      switch (xss.head.$) {
        case '[]':
          return $stripe(xss.tail);
        case '::':
          return $Cons(
            $Cons(xss.head.head, $Nil),
            $zip_cons(xss.head.tail, $stripe(xss.tail))
          );
      }
  }
};

// Extracts the diagonal elements from a list of lists.
// - xss: The input list of lists.
// = A new list containing the diagonal elements.
export const $diagonal = <A>(xss: List<List<A>>): List<A> => {
  return $foldr($append, $Nil, $stripe(xss));
};

export const diagonal = <A>(xss: List<List<A>>) => $diagonal(xss);
