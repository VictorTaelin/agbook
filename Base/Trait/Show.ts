import { String } from '../../Base/String/String';

// Record representing the Show trait
export type Show<A> = {
  to_string: (x: A) => String;
};

// Function to convert a value to a string using its Show instance
export const $show = <A>(show_a: Show<A>, x: A): String => show_a.to_string(x);
export const  show = <A>(show_a: Show<A>) => (x: A) => show_a.to_string(x);

// Helper function to create a Show instance
export const $make_show = <A>(show_impl: (x: A) => String): Show<A> => ({
  to_string: show_impl
});
export const  make_show = <A>(show_impl: (x: A) => String) => $make_show(show_impl);

// NOTE: Using snake_case for TypeScript names as per guidelines