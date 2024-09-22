"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = exports.$$neq = void 0;
const not_1 = require("../../Base/Bool/not");
const eq_1 = require("../../Base/Char/eq");
// Checks if two characters are not equal.
// - x: The first character.
// - y: The second character.
// = True if the characters are not equal, False otherwise.
const $$neq = (x, y) => (0, not_1.$not)((0, eq_1.$eq)(x, y));
exports.$$neq = $$neq;
// NOTE: Using native string inequality for efficiency.
const $neq = (x, y) => x !== y;
exports.$neq = $neq;
const neq = (x) => (y) => x !== y;
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
