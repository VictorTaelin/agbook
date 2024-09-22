"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.xor = exports.$xor = exports.$$xor = void 0;
// Performs logical XOR operation on two bools.
// - a: The 1st bool.
// - b: The 2nd bool.
// = True if a and b are different.
const $$xor = (a, b) => {
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
exports.$$xor = $$xor;
// NOTE: Using native boolean XOR for efficiency.
const $xor = (a, b) => a !== b;
exports.$xor = $xor;
const xor = (a) => (b) => a !== b;
exports.xor = xor;
// NOTE: Operator omitted: '_^_'.
