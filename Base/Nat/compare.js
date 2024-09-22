"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.compare = exports.$compare = exports.$$compare = void 0;
const Type_1 = require("../../Base/Ordering/Type");
// Compares two natural numbers.
// - m: The first natural number.
// - n: The second natural number.
// = LT if m < n, EQ if m = n, GT if m > n.
const $$compare = (m, n) => {
    if (m === 0n) {
        if (n === 0n) {
            return Type_1.$EQ;
        }
        else {
            return Type_1.$LT;
        }
    }
    else {
        if (n === 0n) {
            return Type_1.$GT;
        }
        else {
            var m_ = m - 1n;
            var n_ = n - 1n;
            return (0, exports.$$compare)(m_, n_);
        }
    }
};
exports.$$compare = $$compare;
// NOTE: Using native BigInt comparison for efficiency.
const $compare = (m, n) => {
    if (m < n)
        return Type_1.$LT;
    if (m > n)
        return Type_1.$GT;
    return Type_1.$EQ;
};
exports.$compare = $compare;
const compare = (m) => (n) => (0, exports.$compare)(m, n);
exports.compare = compare;
