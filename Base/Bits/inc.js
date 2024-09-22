"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.inc = exports.$inc = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Increments a binary string by one. Keeps the same length.
// - bs: The input binary string.
// = The incremented binary string.
const $inc = (bs) => {
    switch (bs.$) {
        case 'E':
            return Type_1.E;
        case 'O':
            return (0, Type_1.I)(bs.tail);
        case 'I':
            return (0, Type_1.O)((0, exports.$inc)(bs.tail));
    }
};
exports.$inc = $inc;
const inc = (bs) => (0, exports.$inc)(bs);
exports.inc = inc;
