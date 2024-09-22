"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = exports.$$eq = void 0;
const $$eq = (m, n) => {
    if (m === 0n) {
        if (n === 0n) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        if (n === 0n) {
            return false;
        }
        else {
            var m_ = m - 1n;
            var n_ = n - 1n;
            return (0, exports.$$eq)(m_, n_);
        }
    }
};
exports.$$eq = $$eq;
// NOTE: Using native BigInt equality for efficiency
const $eq = (m, n) => m === n;
exports.$eq = $eq;
const eq = (m) => (n) => m === n;
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
