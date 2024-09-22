"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.add = exports.$add = exports.$$add = void 0;
const to_nat_1 = require("../../Base/U64/to-nat");
const from_nat_1 = require("../../Base/U64/from-nat");
// Addition of two U64 numbers.
// - a: The first U64 number.
// - b: The second U64 number.
// = The sum of a and b as a U64 number.
const $$add = (a, b) => {
    return (0, from_nat_1.$from_nat)((0, to_nat_1.$to_nat)(a) + (0, to_nat_1.$to_nat)(b));
};
exports.$$add = $$add;
// NOTE: Using native BigInt addition for efficiency.
const $add = (a, b) => {
    return BigInt.asUintN(64, a + b);
};
exports.$add = $add;
const add = (a) => (b) => (0, exports.$add)(a, b);
exports.add = add;
// NOTE: Infix operator '_+_' omitted.
