import { String } from '../../Base/String/Type';

// Interface representing the Show trait
export interface Show<A> {
  to_string: (x: A) => String;
}

// Function to convert a value to a string using its Show instance
export const $show = <A>(show_a: Show<A>, x: A): String => show_a.to_string(x);
export const  show = <A>(show_a: Show<A>) => (x: A) => $show(show_a, x);

// Helper function to create a default Show instance
export const $default = <A>(show_impl: (x: A) => String): Show<A> => ({
  to_string: show_impl
});
export const  default_ = <A>(show_impl: (x: A) => String) => $default(show_impl);

// NOTE: 'default' is a reserved keyword in TypeScript, so we use 'default_' instead
// NOTE: Using snake_case for TypeScript names as per guidelines
