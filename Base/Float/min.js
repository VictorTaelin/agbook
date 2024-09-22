"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$min = exports.min = exports.$min = void 0;
const if_1 = require("../../Base/Bool/if");
const lt_1 = require("../../Base/Float/lt");
// Returns the minimum of two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The smaller of x and y.
const $min = (x, y) => {
    return (0, if_1.$if_then_else_)((0, lt_1.$lt)(x, y), x, y);
};
exports.$min = $min;
const min = (x) => (y) => (0, exports.$min)(x, y);
exports.min = min;
// NOTE: Using native JavaScript Math.min for efficiency.
exports.$$min = Math.min;
