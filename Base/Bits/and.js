"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.and = exports.$and = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Performs bitwise AND operation on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the bitwise AND of a and b.
const $and = (a, b) => {
    switch (a.$) {
        case 'E':
            return Type_1.E;
        case 'O':
            switch (b.$) {
                case 'E':
                    return Type_1.E;
                case 'O':
                    return (0, Type_1.O)((0, exports.$and)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.O)((0, exports.$and)(a.tail, b.tail));
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return Type_1.E;
                case 'O':
                    return (0, Type_1.O)((0, exports.$and)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.I)((0, exports.$and)(a.tail, b.tail));
            }
    }
};
exports.$and = $and;
const and = (a) => (b) => (0, exports.$and)(a, b);
exports.and = and;
// NOTE: Operator omitted: '_&&_'.
