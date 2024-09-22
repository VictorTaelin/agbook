"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.make_default = exports.$make_default = exports.gte = exports.$gte = exports.lte = exports.$lte = exports.gt = exports.$gt = exports.lt = exports.$lt = void 0;
const Type_1 = require("../../Base/Ordering/Type");
const eq_1 = require("../../Base/Ordering/eq");
const neq_1 = require("../../Base/Ordering/neq");
const $lt = (ord, a, b) => ord.lt(a, b);
exports.$lt = $lt;
const lt = (ord) => (a) => (b) => ord.lt(a, b);
exports.lt = lt;
const $gt = (ord, a, b) => ord.gt(a, b);
exports.$gt = $gt;
const gt = (ord) => (a) => (b) => ord.gt(a, b);
exports.gt = gt;
const $lte = (ord, a, b) => ord.lte(a, b);
exports.$lte = $lte;
const lte = (ord) => (a) => (b) => ord.lte(a, b);
exports.lte = lte;
const $gte = (ord, a, b) => ord.gte(a, b);
exports.$gte = $gte;
const gte = (ord) => (a) => (b) => ord.gte(a, b);
exports.gte = gte;
const $make_default = (compareImpl) => ({
    compare: compareImpl,
    lt: (x, y) => (0, eq_1.$eq)(compareImpl(x, y), Type_1.LT),
    gt: (x, y) => (0, eq_1.$eq)(compareImpl(x, y), Type_1.GT),
    lte: (x, y) => (0, neq_1.$neq)(compareImpl(x, y), Type_1.GT),
    gte: (x, y) => (0, neq_1.$neq)(compareImpl(x, y), Type_1.LT)
});
exports.$make_default = $make_default;
const make_default = (compareImpl) => (0, exports.$make_default)((a, b) => compareImpl(a)(b));
exports.make_default = make_default;
// NOTE: Operators omitted: '_<_', '_>_', '_<=_', '_>=_'.
// NOTE: 'default' renamed to 'make_default' as 'default' is a keyword in TypeScript.
