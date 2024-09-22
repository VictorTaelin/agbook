"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = void 0;
const not_1 = require("../../Base/Bool/not");
const eq_1 = require("../../Base/Maybe/eq");
const $neq = (eq_a) => (x, y) => (0, not_1.not)((0, eq_1.$eq)(eq_a)(x, y));
exports.$neq = $neq;
const neq = (eq_a) => (x) => (y) => (0, exports.$neq)(eq_a)(x, y);
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
