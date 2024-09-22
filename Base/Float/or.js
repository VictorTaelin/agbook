"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.or = exports.$or = exports.$$or = void 0;
const not_1 = require("../../Base/Bool/not");
const or_1 = require("../../Base/Bool/or");
const eq_1 = require("../../Base/Float/eq");
// Performs a logical OR on two floats.
// - x: the 1st float.
// - y: the 2nd float.
// = True if either x or y (or both) are non-zero, False otherwise.
const $$or = (x, y) => (0, or_1.$or)((0, not_1.$not)((0, eq_1.$eq)(0.0, x)), (0, not_1.$not)((0, eq_1.$eq)(0.0, y)));
exports.$$or = $$or;
// NOTE: Using native JavaScript OR and inequality for efficiency.
const $or = (x, y) => x !== 0 || y !== 0;
exports.$or = $or;
const or = (x) => (y) => x !== 0 || y !== 0;
exports.or = or;
// NOTE: Operator omitted: '_||_'.
