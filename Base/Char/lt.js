"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lt = exports.$lt = void 0;
const to_nat_1 = require("../../Base/Char/to-nat");
const lt_1 = require("../../Base/Nat/lt");
// Compares two characters lexicographically.
// - x: The first character.
// - y: The second character.
// = True if x is lexicographically less than y, False otherwise.
const $lt = (x, y) => (0, lt_1.$lt)((0, to_nat_1.$to_nat)(x), (0, to_nat_1.$to_nat)(y));
exports.$lt = $lt;
const lt = (x) => (y) => (0, exports.$lt)(x, y);
exports.lt = lt;
// NOTE: Operator omitted: '_<_'
// NOTE: Using the to_nat function and then comparing the resulting numbers
// for efficiency and to match the Agda implementation.
