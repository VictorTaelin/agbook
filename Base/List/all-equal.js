"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.all_equal = exports.$all_equal = void 0;
const Type_1 = require("../../Base/Bool/Type");
const and_1 = require("../../Base/Bool/and");
const Eq_1 = require("../../Base/Trait/Eq");
const $all_equal = (eq_a, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$True;
        case '::':
            if (xs.tail.$ === '[]') {
                return Type_1.$True;
            }
            else {
                return (0, and_1.$and)((0, Eq_1.$eq)(eq_a)(xs.head, xs.tail.head), (0, exports.$all_equal)(eq_a, xs.tail));
            }
    }
};
exports.$all_equal = $all_equal;
const all_equal = (eq_a) => (xs) => (0, exports.$all_equal)(eq_a, xs);
exports.all_equal = all_equal;
