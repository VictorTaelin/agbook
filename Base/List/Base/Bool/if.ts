import { Bool } from '../../Base/Bool/Type';

// Conditional expression.
// - cond: The condition to evaluate.
// - then: The value to return if the condition is true.
// - else: The value to return if the condition is false.
// = The 'then' value if 'cond' is True, otherwise the 'else' value.
export const $if_then_else_ = <A>(cond: Bool, then_: A, else_: A): A => {
  if (cond) {
    return then_;
  } else {
    return else_;
  }
};

export const if_then_else_ = <A>(cond: Bool) => (then_: A) => (else_: A) => $if_then_else_(cond, then_, else_);

// NOTE: Using native if-else for efficiency.