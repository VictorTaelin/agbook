// Case expressions (to be used with pattern-matching lambdas).
// - x: The value to match against.
// - f: The function to apply to x.
// = The result of applying f to x.
export const $case_of_ = <A, B>(x: A, f: (a: A) => B): B => f(x);
export const  case_of_ = <A, B>(x: A) => (f: (a: A) => B) => f(x);

// Case expressions with explicit return type.
// - x: The value to match against.
// - B: The return type, which may depend on x.
// - f: The function to apply to x.
// = The result of applying f to x.
export const $case_returning_of_ = <A, B>(x: A, B: (a: A) => any, f: (x: A) => B): B => f(x);
export const  case_returning_of_ = <A, B>(x: A) => (B: (a: A) => any) => (f: (x: A) => B) => f(x);

// NOTE: The 'B' parameter in 'case_returning_of_' is not used in the implementation,
// as TypeScript does not support dependent types. It's kept for consistency with the Agda version.
