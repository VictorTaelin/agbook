"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_bits = exports.$from_bits = void 0;
const Type_1 = require("../../Base/Nat/Type");
const Type_2 = require("../../Base/Maybe/Type");
const double_1 = require("../../Base/Nat/double");
const from_nat_1 = require("../../Base/U64/from-nat");
// Converts a bit representation to a Maybe U64.
// - x: The bit representation to convert.
// = The U64 representation of x, or nothing if conversion fails.
const $from_bits = (b) => {
    const from_bits_go = (bs, acc) => {
        switch (bs.$) {
            case 'E':
                return (0, Type_2.$Some)((0, from_nat_1.$from_nat)(acc));
            case 'O':
                return from_bits_go(bs.tail, (0, double_1.$double)(acc));
            case 'I':
                return from_bits_go(bs.tail, (0, double_1.$double)(acc) + 1n);
        }
    };
    return from_bits_go(b, Type_1.$Zero);
};
exports.$from_bits = $from_bits;
const from_bits = (b) => (0, exports.$from_bits)(b);
exports.from_bits = from_bits;
// NOTE: Using BigInt operations for efficiency while preserving the original algorithm.
