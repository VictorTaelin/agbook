"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.append = exports.$append = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Appends two Bits values.
// - as: The 1st Bits value.
// - bs: The 2nd Bits value.
// = A new Bits value representing the concatenation of as and bs.
const $append = (as, bs) => {
    switch (as.$) {
        case 'E':
            return bs;
        case 'O':
            return (0, Type_1.O)((0, exports.$append)(as.tail, bs));
        case 'I':
            return (0, Type_1.I)((0, exports.$append)(as.tail, bs));
    }
};
exports.$append = $append;
const append = (as) => (bs) => (0, exports.$append)(as, bs);
exports.append = append;
// NOTE: Operator omitted: '_++_'.
