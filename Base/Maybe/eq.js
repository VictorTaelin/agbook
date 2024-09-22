"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
const Type_1 = require("../../Base/Bool/Type");
const $eq = (eq_a) => (a, b) => {
    switch (a.$) {
        case 'None':
            return b.$ === 'None' ? Type_1.$True : Type_1.$False;
        case 'Some':
            return b.$ === 'Some' ? eq_a.eq(a.value, b.value) : Type_1.$False;
    }
};
exports.$eq = $eq;
const eq = (eq_a) => (a) => (b) => (0, exports.$eq)(eq_a)(a, b);
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
