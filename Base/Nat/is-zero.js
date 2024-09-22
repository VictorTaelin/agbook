"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_zero = exports.$is_zero = void 0;
const Type_1 = require("../../Base/Bool/Type");
// Checks if a natural number is zero.
// - n: The natural number to check.
// = True if n is zero, False otherwise.
const $is_zero = (n) => {
    if (n === 0n) {
        return Type_1.$True;
    }
    else {
        return Type_1.$False;
    }
};
exports.$is_zero = $is_zero;
const is_zero = (n) => (0, exports.$is_zero)(n);
exports.is_zero = is_zero;
// NOTE: Using native BigInt comparison for efficiency.
