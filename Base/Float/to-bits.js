"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_bits = exports.$to_bits = void 0;
const Type_1 = require("../../Base/Bits/Type");
const to_u64_1 = require("../../Base/Float/to-u64");
const to_bits_1 = require("../../Base/U64/to-bits");
// Converts a float to its bit representation as Bits.
// - x: The float to convert.
// = The Bits representation of x, or an empty bit sequence if conversion fails.
const $to_bits = (x) => {
    var u64_maybe = (0, to_u64_1.$to_u64)(x);
    switch (u64_maybe.$) {
        case 'Some':
            return (0, to_bits_1.$to_bits)(u64_maybe.value);
        case 'None':
            return Type_1.$E;
    }
};
exports.$to_bits = $to_bits;
const to_bits = (x) => (0, exports.$to_bits)(x);
exports.to_bits = to_bits;
