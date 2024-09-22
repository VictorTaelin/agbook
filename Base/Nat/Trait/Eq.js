"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EqNat = void 0;
const eq_1 = require("../../../Base/Nat/eq");
const neq_1 = require("../../../Base/Nat/neq");
exports.EqNat = {
    eq: eq_1.$eq,
    neq: neq_1.$neq
};
