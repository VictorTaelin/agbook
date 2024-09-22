"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.or = exports.$or = exports.$$or = void 0;
// Performs logical OR operation on two bools.
// - a: The 1st bool.
// - b: The 2nd bool.
// = True if either a or b is true.
const $$or = (a, b) => {
    if (a) {
        return true;
    }
    else {
        return b;
    }
};
exports.$$or = $$or;
// NOTE: Using native boolean OR for efficiency.
const $or = (a, b) => a || b;
exports.$or = $or;
const or = (a) => (b) => a || b;
exports.or = or;
// NOTE: Operator omitted: '_||_'.
