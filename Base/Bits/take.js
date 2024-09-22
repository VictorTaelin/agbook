"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.take = exports.$take = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Takes the first n bits from a Bits structure.
// If n is greater than the length of the Bits, returns the entire Bits structure.
// - n: The number of bits to take.
// - bits: The input Bits structure.
// = A Bits structure containing the first n bits of the input, or all of the input if n > length bits.
const $take = (n, bits) => {
    if (n === 0n) {
        return Type_1.$E;
    }
    else {
        var n_ = n - 1n;
        switch (bits.$) {
            case 'E':
                return Type_1.$E;
            case 'O':
                return (0, Type_1.$O)((0, exports.$take)(n_, bits.tail));
            case 'I':
                return (0, Type_1.$I)((0, exports.$take)(n_, bits.tail));
        }
    }
};
exports.$take = $take;
const take = (n) => (bits) => (0, exports.$take)(n, bits);
exports.take = take;
