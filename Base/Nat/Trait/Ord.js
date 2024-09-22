"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.OrdNat = void 0;
const lt_1 = require("../../../Base/Nat/lt");
const lte_1 = require("../../../Base/Nat/lte");
const gt_1 = require("../../../Base/Nat/gt");
const gte_1 = require("../../../Base/Nat/gte");
const compare_1 = require("../../../Base/Nat/compare");
exports.OrdNat = {
    compare: compare_1.$compare,
    lt: lt_1.$lt,
    lte: lte_1.$lte,
    gt: gt_1.$gt,
    gte: gte_1.$gte
};
