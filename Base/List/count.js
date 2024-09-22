"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.count = exports.$count = exports.$$count = void 0;
const Eq_1 = require("../../Base/Trait/Eq");
const if_1 = require("../../Base/Bool/if");
const Type_1 = require("../../Base/Nat/Type");
const add_1 = require("../../Base/Nat/add");
const $$count = (eq_a, x, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Zero;
        case '::':
            return (0, add_1.$add)((0, if_1.$if_then_else_)((0, Eq_1.$eq)(eq_a)(x, xs.head), 1n, 0n), (0, exports.$$count)(eq_a, x, xs.tail));
    }
};
exports.$$count = $$count;
const $count = (eq_a, x, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Zero;
        case '::':
            return (0, add_1.$add)((0, if_1.$if_then_else_)((0, Eq_1.$eq)(eq_a)(x, xs.head), 1n, 0n), (0, exports.$count)(eq_a, x, xs.tail));
    }
};
exports.$count = $count;
const count = (eq_a) => (x) => (xs) => (0, exports.$count)(eq_a, x, xs);
exports.count = count;
