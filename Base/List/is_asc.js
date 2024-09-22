"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_asc = exports.$is_asc = void 0;
const Type_1 = require("../../Base/Bool/Type");
const and_1 = require("../../Base/Bool/and");
const foldr_1 = require("../../Base/List/foldr");
const Ord_1 = require("../../Base/Nat/Trait/Ord");
const Ord_2 = require("../../Base/Trait/Ord");
// Checks if a list of Nats is in ascending order.
// - xs: The list of Nats to check.
// = True if the list is in ascending order, False otherwise.
const $is_asc = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$True;
        case '::':
            return (0, foldr_1.$foldr)((x, acc) => (l) => (0, and_1.$and)((0, Ord_2.$lte)(Ord_1.OrdNat, l, x), acc(x)), (x) => Type_1.$True, xs.tail)(0n);
    }
};
exports.$is_asc = $is_asc;
const is_asc = (xs) => (0, exports.$is_asc)(xs);
exports.is_asc = is_asc;
