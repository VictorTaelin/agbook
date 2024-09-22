"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.dec = exports.$dec = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Decrements a binary string by one. Keeps the same length.
// - bs: The input binary string.
// = The decremented binary string.
const $dec = (bs) => {
    switch (bs.$) {
        case 'E':
            return Type_1.$E;
        case 'O':
            return (0, Type_1.$I)((0, exports.$dec)(bs.tail));
        case 'I':
            return (0, Type_1.$O)(bs.tail);
    }
};
exports.$dec = $dec;
const dec = (bs) => (0, exports.$dec)(bs);
exports.dec = dec;
