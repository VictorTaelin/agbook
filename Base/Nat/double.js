"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.double = exports.$double = exports.$$double = void 0;
const Type_1 = require("../../Base/Nat/Type");
// Doubles a nat.
// - n: The number to double.
// = The double of n.
const $$double = (n) => {
    if (n === 0n) {
        return Type_1.Zero;
    }
    else {
        var pred = n - 1n;
        return (0, Type_1.Succ)((0, Type_1.Succ)((0, exports.$$double)(pred)));
    }
};
exports.$$double = $$double;
// NOTE: Using native BigInt multiplication for efficiency.
const $double = (n) => n * 2n;
exports.$double = $double;
const double = (n) => (0, exports.$double)(n);
exports.double = double;
