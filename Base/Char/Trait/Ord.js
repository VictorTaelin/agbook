"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.OrdChar = void 0;
const compare_1 = require("../../../Base/Char/compare");
const lt_1 = require("../../../Base/Char/lt");
const gt_1 = require("../../../Base/Char/gt");
const lte_1 = require("../../../Base/Char/lte");
const gte_1 = require("../../../Base/Char/gte");
exports.OrdChar = {
    compare: compare_1.$compare,
    lt: lt_1.$lt,
    gt: gt_1.$gt,
    lte: lte_1.$lte,
    gte: gte_1.$gte
};
// NOTE: We're using the imported functions directly as they already handle the comparison logic.
// This matches the Agda implementation more closely.
