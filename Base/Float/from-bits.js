"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_bits = exports.$from_bits = void 0;
const from_u64_1 = require("../../Base/Float/from-u64");
const Type_1 = require("../../Base/Maybe/Type");
const from_bits_1 = require("../../Base/U64/from-bits");
// Converts a bit representation to a Float
// - b: The bit representation to convert.
// = The Float representation of b, or nothing if conversion fails.
const $from_bits = (b) => {
    const helper = (m) => {
        switch (m.$) {
            case 'Some':
                return (0, Type_1.$Some)((0, from_u64_1.$from_u64)(m.value));
            case 'None':
                return Type_1.$None;
        }
    };
    return helper((0, from_bits_1.$from_bits)(b));
};
exports.$from_bits = $from_bits;
const from_bits = (b) => (0, exports.$from_bits)(b);
exports.from_bits = from_bits;
