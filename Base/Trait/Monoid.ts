import { List, $Cons, $Nil } from '../../Base/List/Type';

export interface Monoid<A> {
  memp: A;
  mapp: (a: A, b: A) => A;
}

// Helper function to use the monoid's mapp function
export const mapp = <A>(monoid: Monoid<A>) => (a: A, b: A): A => monoid.mapp(a, b);

// Infix operator for mapp (not directly translatable to TypeScript)
// _<>_ : ∀ {A : Set} {{monoidA : Monoid A}} → A → A → A
// _<>_ {{monoidA}} = mapp {{monoidA}}

// Concatenates a list of elements using the monoid's operations
export const $concat = <A>(monoid: Monoid<A>, xs: List<A>): A => {
  switch (xs.$) {
    case '[]':
      return monoid.memp;
    case '::':
      return monoid.mapp(xs.head, $concat(monoid, xs.tail));
  }
};

export const concat = <A>(monoid: Monoid<A>) => (xs: List<A>) => $concat(monoid, xs);
