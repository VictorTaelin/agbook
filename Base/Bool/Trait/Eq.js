"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EqBool = void 0;
const eq_1 = require("../../../Base/Bool/eq");
const neq_1 = require("../../../Base/Bool/neq");
exports.EqBool = {
    eq: eq_1.$eq,
    neq: neq_1.$neq
};
