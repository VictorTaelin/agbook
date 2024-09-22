"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.pred = exports.$pred = exports.$$pred = void 0;
const Type_1 = require("../../Base/Nat/Type");
// Returns the predecessor of a natural number.
// - n: The input natural number.
// = The predecessor of n, or Zero if n is already Zero.
const $$pred = (n) => {
    if (n === 0n) {
        return Type_1.Zero;
    }
    else {
        return n - 1n;
    }
};
exports.$$pred = $$pred;
// NOTE: Using native BigInt subtraction for efficiency.
const $pred = (n) => n === 0n ? 0n : n - 1n;
exports.$pred = $pred;
const pred = (n) => (0, exports.$pred)(n);
exports.pred = pred;
