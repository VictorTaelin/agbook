"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = exports.$$neq = void 0;
const $$neq = (m, n) => {
    if (m === 0n) {
        if (n === 0n) {
            return false;
        }
        else {
            return true;
        }
    }
    else {
        var m_ = m - 1n;
        if (n === 0n) {
            return true;
        }
        else {
            var n_ = n - 1n;
            return (0, exports.$$neq)(m_, n_);
        }
    }
};
exports.$$neq = $$neq;
// NOTE: Using native BigInt inequality for efficiency
const $neq = (m, n) => m !== n;
exports.$neq = $neq;
const neq = (m) => (n) => m !== n;
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
