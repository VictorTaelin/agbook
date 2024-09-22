"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.normal = exports.$normal = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Normalizes a Bits representation by removing trailing zeros from the right side.
// - bits: The input Bits value to normalize.
// = A new Bits value with trailing zeros removed.
const $normal = (bits) => {
    switch (bits.$) {
        case 'E':
            return Type_1.$E;
        case 'I':
            return (0, Type_1.$I)((0, exports.$normal)(bits.tail));
        case 'O':
            var normalized_tail = (0, exports.$normal)(bits.tail);
            if (normalized_tail.$ === 'E') {
                return Type_1.$E;
            }
            else {
                return (0, Type_1.$O)(normalized_tail);
            }
    }
};
exports.$normal = $normal;
const normal = (bits) => (0, exports.$normal)(bits);
exports.normal = normal;
