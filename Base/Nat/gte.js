"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gte = exports.$gte = exports.$$gte = void 0;
const or_1 = require("../../Base/Bool/or");
const gt_1 = require("../../Base/Nat/gt");
const eq_1 = require("../../Base/Nat/eq");
const $$gte = (x, y) => {
    return (0, or_1.$or)((0, eq_1.$eq)(x, y), (0, gt_1.$gt)(x, y));
};
exports.$$gte = $$gte;
// NOTE: Using native BigInt comparison for efficiency
const $gte = (x, y) => x >= y;
exports.$gte = $gte;
const gte = (x) => (y) => x >= y;
exports.gte = gte;
// NOTE: Operator omitted: '_>=_'
