"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exp = exports.$exp = exports.$$exp = void 0;
const mul_1 = require("../../Base/Nat/mul");
// Exponentiation of nats.
// - m: The 1st nat.
// - n: The 2nd nat.
// = m to the power of n.
const $$exp = (m, n) => {
    if (n === 0n) {
        return 1n;
    }
    else {
        var pred = n - 1n;
        return (0, mul_1.$mul)(m, (0, exports.$$exp)(m, pred));
    }
};
exports.$$exp = $$exp;
// NOTE: Using native BigInt exponentiation for efficiency.
const $exp = (m, n) => m ** n;
exports.$exp = $exp;
const exp = (m) => (n) => m ** n;
exports.exp = exp;
// NOTE: Operator '_**_' omitted.
