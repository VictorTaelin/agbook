import { List, $Nil, $Cons } from '../../Base/List/List';
import { $map } from '../../Base/List/map';

// Helper function to implement zip-cons.
// - xs: The list to be zipped with.
// - yss: The list of lists to zip with xs.
// = A new list of lists where each element of xs is prepended to the corresponding list in yss.
export const $zip_cons = <A>(xs: List<A>, yss: List<List<A>>): List<List<A>> => {
  switch (xs.$) {
    case '[]':
      return yss;
    case '::':
      switch (yss.$) {
        case '[]':
          return $map((y: A) => $Cons(y, $Nil), xs);
        case '::':
          return $Cons($Cons(xs.head, yss.head), $zip_cons(xs.tail, yss.tail));
      }
  }
};

export const zip_cons = <A>(xs: List<A>) => (yss: List<List<A>>) => $zip_cons(xs, yss);
