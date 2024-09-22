"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.and = exports.$and = exports.$$and = void 0;
// Performs logical AND operation on two boolean values.
// - a: The first boolean value.
// - b: The second boolean value.
// = True if both a and b are true.
const $$and = (a, b) => {
    if (a) {
        return b;
    }
    else {
        return false;
    }
};
exports.$$and = $$and;
// NOTE: Using native boolean AND for efficiency.
const $and = (a, b) => a && b;
exports.$and = $and;
const and = (a) => (b) => a && b;
exports.and = and;
// NOTE: Operator omitted: '_&&_'.
