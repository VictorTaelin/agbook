"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.add = exports.$add = exports.$$add = void 0;
const Type_1 = require("../../Base/Nat/Type");
// Addition of nats.
// - m: The 1st nat.
// - n: The 2nd nat.
// = The sum of m and n.
const $$add = (m, n) => {
    if (m === 0n) {
        return n;
    }
    else {
        var pred = m - 1n;
        return (0, Type_1.$Succ)((0, exports.$$add)(pred, n));
    }
};
exports.$$add = $$add;
// NOTE: Using native BigInt addition for efficiency.
const $add = (m, n) => m + n;
exports.$add = $add;
const add = (m) => (n) => m + n;
exports.add = add;
// NOTE: Operator '_+_' omitted.
