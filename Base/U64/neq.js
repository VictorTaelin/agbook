"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = exports.$$neq = void 0;
const not_1 = require("../../Base/Bool/not");
const eq_1 = require("../../Base/U64/eq");
// Compares two U64 values for inequality
const $$neq = (x, y) => {
    return (0, not_1.$not)((0, eq_1.$eq)(x, y));
};
exports.$$neq = $$neq;
// NOTE: Using native BigInt inequality for efficiency
const $neq = (x, y) => x !== y;
exports.$neq = $neq;
const neq = (x) => (y) => x !== y;
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
