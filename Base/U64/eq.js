"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = exports.$$eq = void 0;
const eq_1 = require("../../Base/Nat/eq");
const to_nat_1 = require("../../Base/U64/to-nat");
// Compares two U64 values for equality
const $$eq = (x, y) => {
    return (0, eq_1.$eq)((0, to_nat_1.$to_nat)(x), (0, to_nat_1.$to_nat)(y));
};
exports.$$eq = $$eq;
// NOTE: Using native BigInt equality for efficiency
const $eq = (x, y) => x === y;
exports.$eq = $eq;
const eq = (x) => (y) => x === y;
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
