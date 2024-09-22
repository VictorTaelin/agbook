"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.div = exports.$div = exports.$$div = void 0;
// Helper function div-helper for Euclidean division.
const $$div_helper = (k, m, n, j) => {
    if (n === 0n) {
        return k;
    }
    else {
        var n_ = n - 1n;
        if (j === 0n) {
            return $$div_helper(k + 1n, m, n_, m);
        }
        else {
            var j_ = j - 1n;
            return $$div_helper(k, m, n_, j_);
        }
    }
};
// Integer division of nats.
// - m: The dividend.
// - n: The divisor (must be non-zero).
// = The quotient of m divided by n.
const $$div = (m, n) => {
    if (n === 0n) {
        return 0n; // Division by zero returns zero.
    }
    else {
        var n_ = n - 1n;
        return $$div_helper(0n, n_, m, n_);
    }
};
exports.$$div = $$div;
// NOTE: Using native BigInt division for efficiency, with a check for division by zero.
const $div = (m, n) => n === 0n ? 0n : m / n;
exports.$div = $div;
const div = (m) => (n) => (0, exports.$div)(m, n);
exports.div = div;
