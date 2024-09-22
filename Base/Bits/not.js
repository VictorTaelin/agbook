"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.not = exports.$not = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Performs bitwise NOT operation on a Bits value.
// - bits: The input Bits value.
// = A new Bits value representing the bitwise NOT of the input.
const $not = (bits) => {
    switch (bits.$) {
        case 'E':
            return Type_1.$E;
        case 'O':
            return (0, Type_1.$I)((0, exports.$not)(bits.tail));
        case 'I':
            return (0, Type_1.$O)((0, exports.$not)(bits.tail));
    }
};
exports.$not = $not;
const not = (bits) => (0, exports.$not)(bits);
exports.not = not;
// NOTE: Prefix operator '~_' omitted in TypeScript.
