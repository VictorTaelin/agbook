// Represents equality between two values of the same type.
export type Equal<A> = null;

// The refl constructor for equality.
export const $refl: Equal<any> = null;
export const  refl: Equal<any> = null;

// Type alias for the equality type, matching Agda's infix notation.
export type $equals<A> = Equal<A>;

// Function version of the equality type, for use in expressions.
export const equals = <A>(_x: A) => (_y: A): Equal<A> => null;
