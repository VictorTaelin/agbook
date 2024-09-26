import { Bool } from '../../Base/Bool/Bool';

// Conditional expression.
// - x: The boolean condition to evaluate.
// - t: The value to return if the condition is true.
// - f: The value to return if the condition is false.
// = Either t or f, depending on the condition.
export const $if_then_else_ = <A>(x: Bool, t: A, f: A): A => {
  if (x) {
    return t;
  } else {
    return f;
  }
};

export const if_then_else_ = <A>(x: Bool) => (t: A) => (f: A) => $if_then_else_(x, t, f);

// NOTE: Using native if-else for efficiency.
export const $$if_then_else_ = <A>(x: Bool, t: A, f: A): A => {
  switch (x) {
    case true:
      return t;
    case false:
      return f;
  }
};
