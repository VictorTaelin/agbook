"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = exports.$$neq = void 0;
const not_1 = require("../../Base/Bool/not");
const eq_1 = require("../../Base/Float/eq");
// Checks if two Float values are not equal.
// - x: The first Float value.
// - y: The second Float value.
// = True if x and y are not equal, False otherwise.
const $$neq = (x, y) => (0, not_1.$not)((0, eq_1.$eq)(x, y));
exports.$$neq = $$neq;
// NOTE: Using native JavaScript inequality operator for efficiency.
const $neq = (x, y) => x !== y;
exports.$neq = $neq;
const neq = (x) => (y) => x !== y;
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
