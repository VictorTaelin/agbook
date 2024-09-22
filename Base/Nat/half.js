"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.half = exports.$half = exports.$$half = void 0;
const Type_1 = require("../../Base/Nat/Type");
// Calculates half of a natural number.
// - n: The number to halve.
// = The largest natural number not exceeding n/2.
const $$half = (n) => {
    if (n === 0n) {
        return Type_1.Zero;
    }
    else if (n === 1n) {
        return Type_1.Zero;
    }
    else {
        var n_ = n - 2n;
        return 1n + (0, exports.$half)(n_);
    }
};
exports.$$half = $$half;
// NOTE: Using native BigInt division for efficiency.
const $half = (n) => n / 2n;
exports.$half = $half;
const half = (n) => (0, exports.$half)(n);
exports.half = half;
