"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default_ = exports.$default = exports.neq = exports.$neq = exports.eq = exports.$eq = void 0;
const not_1 = require("../../Base/Bool/not");
const $eq = (eq_a) => (a, b) => eq_a.eq(a, b);
exports.$eq = $eq;
const eq = (eq_a) => (a) => (b) => eq_a.eq(a, b);
exports.eq = eq;
const $neq = (eq_a) => (a, b) => eq_a.neq(a, b);
exports.$neq = $neq;
const neq = (eq_a) => (a) => (b) => eq_a.neq(a, b);
exports.neq = neq;
// NOTE: Operators omitted: '_==_' and '_!=_'.
const $default = (eq_impl) => ({
    eq: eq_impl,
    neq: (a, b) => (0, not_1.not)(eq_impl(a, b))
});
exports.$default = $default;
const default_ = (eq_impl) => (0, exports.$default)((a, b) => eq_impl(a)(b));
exports.default_ = default_;
