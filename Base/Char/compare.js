"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.compare = exports.$compare = void 0;
const to_nat_1 = require("../../Base/Char/to-nat");
const compare_1 = require("../../Base/Nat/compare");
// Compares two characters.
// - x: The first character.
// - y: The second character.
// = LT if x < y, EQ if x = y, GT if x > y.
const $compare = (x, y) => {
    return (0, compare_1.$compare)((0, to_nat_1.$to_nat)(x), (0, to_nat_1.$to_nat)(y));
};
exports.$compare = $compare;
const compare = (x) => (y) => (0, exports.$compare)(x, y);
exports.compare = compare;
// NOTE: Using to_nat and Nat.compare as in the Agda implementation.
