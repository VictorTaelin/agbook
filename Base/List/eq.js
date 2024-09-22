"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
const Type_1 = require("../../Base/Bool/Type");
const and_1 = require("../../Base/Bool/and");
const $eq = (eq_a) => (xs, ys) => {
    switch (xs.$) {
        case '[]':
            switch (ys.$) {
                case '[]':
                    return Type_1.$True;
                default:
                    return Type_1.$False;
            }
        case '::':
            switch (ys.$) {
                case '::':
                    return (0, and_1.$and)(eq_a.eq(xs.head, ys.head), (0, exports.$eq)(eq_a)(xs.tail, ys.tail));
                default:
                    return Type_1.$False;
            }
    }
};
exports.$eq = $eq;
const eq = (eq_a) => (xs) => (ys) => (0, exports.$eq)(eq_a)(xs, ys);
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
