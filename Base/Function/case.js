"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.case_returning_of_ = exports.$case_returning_of_ = exports.case_of_ = exports.$case_of_ = void 0;
// Case expressions (to be used with pattern-matching lambdas).
// - x: The value to match against.
// - f: The function to apply to x.
// = The result of applying f to x.
const $case_of_ = (x, f) => f(x);
exports.$case_of_ = $case_of_;
const case_of_ = (x) => (f) => f(x);
exports.case_of_ = case_of_;
// Case expressions with explicit return type.
// - x: The value to match against.
// - B: The return type, which may depend on x.
// - f: The function to apply to x.
// = The result of applying f to x.
const $case_returning_of_ = (x, B, f) => f(x);
exports.$case_returning_of_ = $case_returning_of_;
const case_returning_of_ = (x) => (B) => (f) => f(x);
exports.case_returning_of_ = case_returning_of_;
// NOTE: The 'B' parameter in 'case_returning_of_' is not used in the implementation,
// as TypeScript does not support dependent types. It's kept for consistency with the Agda version.
