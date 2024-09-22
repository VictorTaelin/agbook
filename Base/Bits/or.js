"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.or = exports.$or = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Performs bitwise OR operation on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the bitwise OR of a and b.
const $or = (a, b) => {
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
                    return (0, Type_1.$O)((0, exports.$or)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.$I)((0, exports.$or)(a.tail, b.tail));
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                case 'I':
                    return (0, Type_1.$I)((0, exports.$or)(a.tail, b.tail));
            }
    }
};
exports.$or = $or;
const or = (a) => (b) => (0, exports.$or)(a, b);
exports.or = or;
// NOTE: Operator omitted: '_||_'.
