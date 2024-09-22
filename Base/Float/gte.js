"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gte = exports.$gte = exports.$$gte = void 0;
const not_1 = require("../../Base/Bool/not");
const lt_1 = require("../../Base/Float/lt");
// Compares two Float values for greater than or equal to relationship.
// - x: The first Float value.
// - y: The second Float value.
// = True if x is greater than or equal to y, False otherwise.
const $$gte = (x, y) => (0, not_1.$not)((0, lt_1.$lt)(x, y));
exports.$$gte = $$gte;
// NOTE: Using native JavaScript greater than or equal to operator for efficiency.
const $gte = (x, y) => x >= y;
exports.$gte = $gte;
const gte = (x) => (y) => x >= y;
exports.gte = gte;
// NOTE: Operator omitted: '_>=_'.
