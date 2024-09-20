import { List, $Cons, $Nil } from '../../Base/List/Type';

// Zips two lists into a single list using a combining function.
// - f: The function to combine elements from both lists.
// - xs: The first input list.
// - ys: The second input list.
// = A new list where each element is the result of applying f to
//   corresponding elements from xs and ys.
export const $zip_with = <A, B, C>(f: (a: A, b: B) => C, xs: List<A>, ys: List<B>): List<C> => {
  if (xs.$ === '::' && ys.$ === '::') {
    return $Cons(f(xs.head, ys.head), $zip_with(f, xs.tail, ys.tail));
  } else {
    return $Nil;
  }
};

export const zip_with = <A, B, C>(f: (a: A, b: B) => C) => (xs: List<A>) => (ys: List<B>) => $zip_with(f, xs, ys);
