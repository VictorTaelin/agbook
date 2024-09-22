"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = exports.$$neq = void 0;
// Checks if two boolean values are not equal.
// - a: The first boolean value.
// - b: The second boolean value.
// = True if a and b are different, False otherwise.
const $$neq = (a, b) => {
    if (a) {
        if (b) {
            return false;
        }
        else {
            return true;
        }
    }
    else {
        if (b) {
            return true;
        }
        else {
            return false;
        }
    }
};
exports.$$neq = $$neq;
// NOTE: Using native boolean inequality for efficiency.
const $neq = (a, b) => a !== b;
exports.$neq = $neq;
const neq = (a) => (b) => a !== b;
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
