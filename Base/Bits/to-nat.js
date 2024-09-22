"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_nat = exports.$to_nat = void 0;
const Type_1 = require("../../Base/Nat/Type");
const add_1 = require("../../Base/Nat/add");
const mul_1 = require("../../Base/Nat/mul");
// Converts a Bits value to its corresponding natural number.
// The rightmost bit is the least significant.
// - bits: The Bits value to convert.
// = The natural number representation of the Bits value.
const $to_nat = (bits) => {
    const go = (bs, acc, weight) => {
        switch (bs.$) {
            case 'E':
                return acc;
            case 'O':
                return go(bs.tail, acc, (0, mul_1.$mul)(2n, weight));
            case 'I':
                return go(bs.tail, (0, add_1.$add)(acc, weight), (0, mul_1.$mul)(2n, weight));
        }
    };
    return go(bits, Type_1.$Zero, 1n);
};
exports.$to_nat = $to_nat;
const to_nat = (bits) => (0, exports.$to_nat)(bits);
exports.to_nat = to_nat;
