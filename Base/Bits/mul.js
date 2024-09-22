"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mul = exports.$mul = void 0;
const Type_1 = require("../../Base/Bits/Type");
const add_1 = require("../../Base/Bits/add");
// Performs multiplication of two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the product of a and b.
const $mul = (a, b) => {
    switch (a.$) {
        case 'E':
            return Type_1.E;
        case 'O':
            switch (b.$) {
                case 'E':
                    return Type_1.E;
                default:
                    return (0, Type_1.O)((0, exports.$mul)(a.tail, b));
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return Type_1.E;
                default:
                    return (0, add_1.$add)(b, (0, Type_1.O)((0, exports.$mul)(a.tail, b)));
            }
    }
};
exports.$mul = $mul;
const mul = (a) => (b) => (0, exports.$mul)(a, b);
exports.mul = mul;
// NOTE: Operator omitted: '_*_'.
