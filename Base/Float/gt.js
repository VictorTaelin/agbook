"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$gt = exports.gt = exports.$gt = void 0;
const lt_1 = require("../../Base/Float/lt");
// Compares two Float values for greater than relationship.
// - x: The first Float value.
// - y: The second Float value.
// = True if x is greater than y, False otherwise.
const $gt = (x, y) => (0, lt_1.$lt)(y, x);
exports.$gt = $gt;
const gt = (x) => (y) => (0, lt_1.$lt)(y, x);
exports.gt = gt;
// NOTE: Using native JavaScript greater than operator for efficiency.
const $$gt = (x, y) => x > y;
exports.$$gt = $$gt;
// NOTE: Operator omitted: '_>_'.
