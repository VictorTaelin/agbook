// Represents the Add trait for a type A
export interface Add<A> {
  add: (a: A, b: A) => A;
}

// Helper function to create an Add instance
export const $make_add = <A>(add_impl: (a: A, b: A) => A): Add<A> => ({
  add: add_impl,
});

export const make_add = <A>(add_impl: (a: A, b: A) => A) => $make_add(add_impl);

// Helper function to use the Add trait
export const $add = <A>(add_a: Add<A>, a: A, b: A): A => add_a.add(a, b);
export const  add = <A>(add_a: Add<A>) => (a: A) => (b: A): A => add_a.add(a, b);

// NOTE: Infix operator '_+_' omitted as it's not directly translatable to TypeScript.
// Use the `add` function instead.
