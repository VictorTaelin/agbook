"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.xor = exports.$xor = void 0;
const to_bits_1 = require("../../Base/Nat/to-bits");
const xor_1 = require("../../Base/Bits/xor");
const to_nat_1 = require("../../Base/Bits/to-nat");
const $xor = (a, b) => {
    return (0, to_nat_1.$to_nat)((0, xor_1.$xor)((0, to_bits_1.$to_bits)(a), (0, to_bits_1.$to_bits)(b)));
};
exports.$xor = $xor;
const xor = (a) => (b) => (0, exports.$xor)(a, b);
exports.xor = xor;
// NOTE: Operator omitted: '_^_'.
