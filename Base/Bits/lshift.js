"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lshift = exports.$lshift = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Performs left shift operation on a Bits value.
// - bits: The input Bits value.
// - n: The number of positions to shift left (represented as Nat).
// = A new Bits value representing the left-shifted result.
const $lshift = (bits, n) => {
    if (n === 0n) {
        return bits;
    }
    else if (bits.$ === 'E') {
        return Type_1.$E;
    }
    else {
        var n_ = n - 1n;
        return (0, exports.$lshift)((0, Type_1.$O)(bits), n_);
    }
};
exports.$lshift = $lshift;
const lshift = (bits) => (n) => (0, exports.$lshift)(bits, n);
exports.lshift = lshift;
// NOTE: Operator omitted: '_<<_'.
