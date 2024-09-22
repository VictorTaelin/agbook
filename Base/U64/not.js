"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.not = exports.$not = void 0;
const to_nat_1 = require("../../Base/Bits/to-nat");
const not_1 = require("../../Base/Bits/not");
const to_bits_1 = require("../../Base/U64/to-bits");
const from_nat_1 = require("../../Base/U64/from-nat");
// Performs bitwise NOT operation on a U64 value.
// - x: The U64 value to be negated.
// = The result of bitwise NOT on x.
const $not = (x) => {
    return (0, from_nat_1.$from_nat)((0, to_nat_1.$to_nat)((0, not_1.$not)((0, to_bits_1.$to_bits)(x))));
};
exports.$not = $not;
const not = (x) => (0, exports.$not)(x);
exports.not = not;
// NOTE: Infix operator '~_' is not directly translatable to TypeScript.
// Users can use the 'not' function instead.
