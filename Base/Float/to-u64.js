"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_u64 = exports.$to_u64 = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Converts a float to its U64 representation.
// - x: The float to convert
// = The U64 representation of x, or nothing if conversion fails.
const $to_u64 = (x) => {
    if (x >= 0 && x <= 18446744073709551615 && Number.isInteger(x)) {
        return (0, Type_1.$Some)(BigInt(x));
    }
    else {
        return Type_1.$None;
    }
};
exports.$to_u64 = $to_u64;
const to_u64 = (x) => (0, exports.$to_u64)(x);
exports.to_u64 = to_u64;
// NOTE: This implementation checks if the float is within the valid range for U64
// and is an integer before converting. It returns None for values outside this range
// or for non-integer values.
