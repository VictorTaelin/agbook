"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lte = exports.$lte = exports.$$lte = void 0;
const lt_1 = require("../../Base/Float/lt");
// Compares two Float values for less than or equal to relationship.
// - x: The first Float value.
// - y: The second Float value.
// = True if x is less than or equal to y, False otherwise.
const $$lte = (x, y) => {
    return !(0, lt_1.$lt)(y, x);
};
exports.$$lte = $$lte;
// NOTE: Using native JavaScript less than or equal to operator for efficiency.
const $lte = (x, y) => x <= y;
exports.$lte = $lte;
const lte = (x) => (y) => x <= y;
exports.lte = lte;
// NOTE: Operator omitted: '_<=_'.
