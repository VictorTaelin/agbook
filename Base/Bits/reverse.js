"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.reverse = exports.$reverse = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Reverses the order of bits in a binary string.
// - bits: The input binary string.
// = The reversed binary string.
const $reverse = (bits) => {
    const go = (acc, bits) => {
        switch (bits.$) {
            case 'E':
                return acc;
            case 'O':
                return go((0, Type_1.$O)(acc), bits.tail);
            case 'I':
                return go((0, Type_1.$I)(acc), bits.tail);
        }
    };
    return go(Type_1.$E, bits);
};
exports.$reverse = $reverse;
const reverse = (bits) => (0, exports.$reverse)(bits);
exports.reverse = reverse;
