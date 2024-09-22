"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.pred = exports.$pred = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Decrements a binary string by one, potentially reducing its size.
// - bs: The input binary string.
// = The decremented binary string, with leading zeros removed.
const $pred = (bs) => {
    switch (bs.$) {
        case 'E':
            return Type_1.$E;
        case 'O':
            if (bs.tail.$ === 'E') {
                return Type_1.$E;
            }
            else {
                return (0, Type_1.$I)((0, exports.$pred)(bs.tail));
            }
        case 'I':
            return (0, Type_1.$O)(bs.tail);
    }
};
exports.$pred = $pred;
const pred = (bs) => (0, exports.$pred)(bs);
exports.pred = pred;
// Examples:
// pred E             = E       (0 -> 0)
// pred (I E)         = O E     (1 -> 0)
// pred (O (I E))     = I E     (10 -> 1)
// pred (I (I E))     = O (I E) (11 -> 10)
// pred (O (O (I E))) = I (I E) (100 -> 11)
