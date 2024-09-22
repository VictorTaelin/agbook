"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sub = exports.$sub = exports.$$sub = void 0;
// Subtracts one nat from another.
// - m: The number to subtract from.
// - n: The number to subtract.
// = The result of m - n, or zero if n > m.
const $$sub = (m, n) => {
    if (n === 0n) {
        return m;
    }
    else if (m === 0n) {
        return 0n;
    }
    else {
        var m_ = m - 1n;
        var n_ = n - 1n;
        return (0, exports.$$sub)(m_, n_);
    }
};
exports.$$sub = $$sub;
// NOTE: Native BigInt subtraction used for efficiency, with a check to ensure non-negative result.
const $sub = (m, n) => m >= n ? m - n : 0n;
exports.$sub = $sub;
const sub = (m) => (n) => (0, exports.$sub)(m, n);
exports.sub = sub;
// NOTE: Operator omitted: '_-_'.
