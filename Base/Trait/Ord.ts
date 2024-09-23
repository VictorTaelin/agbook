import { Bool } from '../../Base/Bool/Type';
import { Ordering, $LT, $GT } from '../../Base/Ordering/Type';
import { $eq } from '../../Base/Ordering/eq';
import { $neq } from '../../Base/Ordering/neq';

export interface Ord<A> {
  compare: (a: A, b: A) => Ordering;
  lt: (a: A, b: A) => Bool;
  gt: (a: A, b: A) => Bool;
  lte: (a: A, b: A) => Bool;
  gte: (a: A, b: A) => Bool;
}

export const $lt = <A>(ord: Ord<A>, a: A, b: A): Bool => ord.lt(a, b);
export const  lt = <A>(ord: Ord<A>) => (a: A) => (b: A): Bool => ord.lt(a, b);

export const $gt = <A>(ord: Ord<A>, a: A, b: A): Bool => ord.gt(a, b);
export const  gt = <A>(ord: Ord<A>) => (a: A) => (b: A): Bool => ord.gt(a, b);

export const $lte = <A>(ord: Ord<A>, a: A, b: A): Bool => ord.lte(a, b);
export const  lte = <A>(ord: Ord<A>) => (a: A) => (b: A): Bool => ord.lte(a, b);

export const $gte = <A>(ord: Ord<A>, a: A, b: A): Bool => ord.gte(a, b);
export const  gte = <A>(ord: Ord<A>) => (a: A) => (b: A): Bool => ord.gte(a, b);

export const $make_ord = <A>(compare_impl: (a: A, b: A) => Ordering): Ord<A> => ({
  compare: compare_impl,
  lt: (x: A, y: A) => $eq(compare_impl(x, y), $LT),
  gt: (x: A, y: A) => $eq(compare_impl(x, y), $GT),
  lte: (x: A, y: A) => $neq(compare_impl(x, y), $GT),
  gte: (x: A, y: A) => $neq(compare_impl(x, y), $LT)
});

export const make_ord = <A>(compare_impl: (a: A) => (b: A) => Ordering) =>
  $make_ord((a: A, b: A) => compare_impl(a)(b));

// NOTE: Operators omitted: '_<_', '_>_', '_<=_', '_>=_'.