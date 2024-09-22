"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gt = exports.$gt = void 0;
const to_nat_1 = require("../../Base/Char/to-nat");
const gt_1 = require("../../Base/Nat/gt");
// Compares two characters.
// - x: The first character.
// - y: The second character.
// = True if x is greater than y, False otherwise.
const $gt = (x, y) => (0, gt_1.$gt)((0, to_nat_1.$to_nat)(x), (0, to_nat_1.$to_nat)(y));
exports.$gt = $gt;
const gt = (x) => (y) => (0, exports.$gt)(x, y);
exports.gt = gt;
// NOTE: Operator omitted: '_>_'
