"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.xor = exports.$xor = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Performs bitwise XOR operation on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the bitwise XOR of a and b.
const $xor = (a, b) => {
    switch (a.$) {
        case 'E':
            switch (b.$) {
                case 'E':
                    return Type_1.$E;
                default:
                    return b;
            }
        case 'O':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                    return (0, Type_1.$O)((0, exports.$xor)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.$I)((0, exports.$xor)(a.tail, b.tail));
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                    return (0, Type_1.$I)((0, exports.$xor)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.$O)((0, exports.$xor)(a.tail, b.tail));
            }
    }
};
exports.$xor = $xor;
const xor = (a) => (b) => (0, exports.$xor)(a, b);
exports.xor = xor;
// NOTE: Operator omitted: '_^_'.
