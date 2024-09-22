"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lte = exports.$lte = exports.$$lte = void 0;
const or_1 = require("../../Base/Bool/or");
const eq_1 = require("../../Base/Nat/eq");
const lt_1 = require("../../Base/Nat/lt");
const $$lte = (x, y) => {
    return (0, or_1.$or)((0, eq_1.$eq)(x, y), (0, lt_1.$lt)(x, y));
};
exports.$$lte = $$lte;
// NOTE: Using native BigInt comparison for efficiency
const $lte = (x, y) => x <= y;
exports.$lte = $lte;
const lte = (x) => (y) => x <= y;
exports.lte = lte;
// NOTE: Operator omitted: '_<=_'
