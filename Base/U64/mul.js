"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mul = exports.$mul = exports.$$mul = void 0;
const to_nat_1 = require("../../Base/U64/to-nat");
const from_nat_1 = require("../../Base/U64/from-nat");
// Multiplies two U64 values.
// - a: The first U64 to multiply.
// - b: The second U64 to multiply.
// = The result of a * b, potentially wrapping around due to 64-bit limitation.
const $$mul = (a, b) => {
    return (0, from_nat_1.$from_nat)((0, to_nat_1.$to_nat)(a) * (0, to_nat_1.$to_nat)(b));
};
exports.$$mul = $$mul;
// NOTE: Using native BigInt multiplication for efficiency, then ensuring the result is within U64 range.
const $mul = (a, b) => BigInt.asUintN(64, a * b);
exports.$mul = $mul;
const mul = (a) => (b) => (0, exports.$mul)(a, b);
exports.mul = mul;
// NOTE: Operator '_*_' omitted.
