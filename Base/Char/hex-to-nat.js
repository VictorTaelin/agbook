"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.hex_to_nat = exports.$hex_to_nat = void 0;
const Type_1 = require("../../Base/Maybe/Type");
const digit_to_nat_1 = require("../../Base/Char/digit-to-nat");
// Converts a hexadecimal character to its corresponding natural number
const $hex_to_nat = (c) => {
    var digit_result = (0, digit_to_nat_1.$digit_to_nat)(c);
    if (digit_result.$ === 'Some') {
        return digit_result;
    }
    else {
        switch (c) {
            case 'a':
            case 'A': return (0, Type_1.Some)(10n);
            case 'b':
            case 'B': return (0, Type_1.Some)(11n);
            case 'c':
            case 'C': return (0, Type_1.Some)(12n);
            case 'd':
            case 'D': return (0, Type_1.Some)(13n);
            case 'e':
            case 'E': return (0, Type_1.Some)(14n);
            case 'f':
            case 'F': return (0, Type_1.Some)(15n);
            default: return Type_1.None;
        }
    }
};
exports.$hex_to_nat = $hex_to_nat;
const hex_to_nat = (c) => (0, exports.$hex_to_nat)(c);
exports.hex_to_nat = hex_to_nat;
