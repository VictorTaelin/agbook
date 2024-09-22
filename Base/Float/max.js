"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$max = exports.max = exports.$max = void 0;
const if_1 = require("../../Base/Bool/if");
const lt_1 = require("../../Base/Float/lt");
// Returns the maximum of two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The larger of x and y.
const $max = (x, y) => {
    return (0, if_1.$if_then_else_)((0, lt_1.$lt)(x, y), y, x);
};
exports.$max = $max;
const max = (x) => (y) => (0, exports.$max)(x, y);
exports.max = max;
// NOTE: Using native JavaScript Math.max for efficiency.
const $$max = (x, y) => Math.max(x, y);
exports.$$max = $$max;
