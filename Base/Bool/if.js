"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$if_then_else_ = exports.if_then_else_ = exports.$if_then_else_ = void 0;
// Conditional expression.
// - x: The boolean condition to evaluate.
// - t: The value to return if the condition is true.
// - f: The value to return if the condition is false.
// = Either t or f, depending on the condition.
const $if_then_else_ = (x, t, f) => {
    if (x) {
        return t;
    }
    else {
        return f;
    }
};
exports.$if_then_else_ = $if_then_else_;
const if_then_else_ = (x) => (t) => (f) => (0, exports.$if_then_else_)(x, t, f);
exports.if_then_else_ = if_then_else_;
// NOTE: Using native if-else for efficiency.
const $$if_then_else_ = (x, t, f) => {
    switch (x) {
        case true:
            return t;
        case false:
            return f;
    }
};
exports.$$if_then_else_ = $$if_then_else_;
