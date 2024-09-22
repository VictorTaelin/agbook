"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lte = exports.$lte = exports.$$lte = void 0;
const to_nat_1 = require("../../Base/Char/to-nat");
const lte_1 = require("../../Base/Nat/lte");
// Compares two characters lexicographically.
// - x: The first character.
// - y: The second character.
// = true if x is less than or equal to y, false otherwise.
const $$lte = (x, y) => {
    return (0, lte_1.$lte)((0, to_nat_1.$to_nat)(x), (0, to_nat_1.$to_nat)(y));
};
exports.$$lte = $$lte;
// NOTE: Using native string comparison for efficiency
const $lte = (x, y) => x <= y;
exports.$lte = $lte;
const lte = (x) => (y) => x <= y;
exports.lte = lte;
// NOTE: Operator omitted: '_<=_'
