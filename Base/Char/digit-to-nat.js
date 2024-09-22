"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.digit_to_nat = exports.$digit_to_nat = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Converts a digit character to its corresponding natural number
const $digit_to_nat = (c) => {
    switch (c) {
        case '0': return (0, Type_1.Some)(0n);
        case '1': return (0, Type_1.Some)(1n);
        case '2': return (0, Type_1.Some)(2n);
        case '3': return (0, Type_1.Some)(3n);
        case '4': return (0, Type_1.Some)(4n);
        case '5': return (0, Type_1.Some)(5n);
        case '6': return (0, Type_1.Some)(6n);
        case '7': return (0, Type_1.Some)(7n);
        case '8': return (0, Type_1.Some)(8n);
        case '9': return (0, Type_1.Some)(9n);
        default: return Type_1.None;
    }
};
exports.$digit_to_nat = $digit_to_nat;
const digit_to_nat = (c) => (0, exports.$digit_to_nat)(c);
exports.digit_to_nat = digit_to_nat;
