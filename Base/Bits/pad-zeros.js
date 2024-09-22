"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.pad_zeros = exports.$pad_zeros = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Pads Bits with insignificant zeroes to achieve a specific length.
// - n: The desired length of the resulting Bits.
// - bits: The original Bits to be padded.
// = A new Bits value with the same significance as the input, 
//   but padded with leading zeroes to reach the specified length.
const $pad_zeros = (n, bits) => {
    if (n === 0n) {
        return bits;
    }
    else {
        var n_ = n - 1n;
        switch (bits.$) {
            case 'E':
                return (0, Type_1.$O)((0, exports.$pad_zeros)(n_, Type_1.$E));
            case 'O':
                return (0, Type_1.$O)((0, exports.$pad_zeros)(n_, bits.tail));
            case 'I':
                return (0, Type_1.$I)((0, exports.$pad_zeros)(n_, bits.tail));
        }
    }
};
exports.$pad_zeros = $pad_zeros;
const pad_zeros = (n) => (bits) => (0, exports.$pad_zeros)(n, bits);
exports.pad_zeros = pad_zeros;
