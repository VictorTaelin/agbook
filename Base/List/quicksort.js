"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.quicksort = exports.$quicksort = void 0;
const Type_1 = require("../../Base/List/Type");
const append_1 = require("../../Base/List/append");
const filter_1 = require("../../Base/List/filter");
const Ord_1 = require("../../Base/Nat/Trait/Ord");
const Ord_2 = require("../../Base/Trait/Ord");
// Quicksort algorithm for sorting lists of natural numbers.
// - xs: The input list to be sorted.
// = A new list containing all elements from xs in ascending order.
const $quicksort = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Nil;
        case '::':
            var x = xs.head;
            var rest = xs.tail;
            var min = (0, filter_1.$filter)((y) => (0, Ord_2.$lt)(Ord_1.OrdNat, y, x), rest);
            var max = (0, filter_1.$filter)((y) => (0, Ord_2.$gt)(Ord_1.OrdNat, y, x), rest);
            return (0, append_1.$append)((0, exports.$quicksort)(min), (0, Type_1.$Cons)(x, (0, exports.$quicksort)(max)));
    }
};
exports.$quicksort = $quicksort;
const quicksort = (xs) => (0, exports.$quicksort)(xs);
exports.quicksort = quicksort;
