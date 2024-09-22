"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mul = exports.$mul = exports.$$mul = void 0;
const add_1 = require("../../Base/Nat/add");
// Multiplication of nats.
// - m: The 1st nat.
// - n: The 2nd nat.
// = The product of m and n.
const $$mul = (m, n) => {
    if (m === 0n) {
        return 0n;
    }
    else {
        var pred = m - 1n;
        return (0, add_1.$add)(n, (0, exports.$$mul)(pred, n));
    }
};
exports.$$mul = $$mul;
// NOTE: Using native BigInt multiplication for efficiency.
const $mul = (m, n) => m * n;
exports.$mul = $mul;
const mul = (m) => (n) => m * n;
exports.mul = mul;
// NOTE: Operator '_*_' omitted.
