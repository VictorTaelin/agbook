"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.split = exports.$split = void 0;
const Type_1 = require("../../Base/List/Type");
const Type_2 = require("../../Base/Pair/Type");
const case_1 = require("../../Base/Function/case");
// Splits a list at the first element that satisfies the given predicate.
// - pred: A predicate function that determines where to split the list.
// - xs: The input list.
// = A pair of lists: the part before the split element and the part after (excluding the split element).
const $split = (pred, xs) => {
    switch (xs.$) {
        case '[]':
            return (0, Type_2.$Pair)(Type_1.$Nil, Type_1.$Nil);
        case '::':
            return (0, case_1.$case_of_)(pred(xs.head), (result) => {
                if (result) {
                    return (0, Type_2.$Pair)(Type_1.$Nil, xs.tail);
                }
                else {
                    var split_result = (0, exports.$split)(pred, xs.tail);
                    return (0, Type_2.$Pair)((0, Type_1.$Cons)(xs.head, split_result[0]), split_result[1]);
                }
            });
    }
};
exports.$split = $split;
const split = (pred) => (xs) => (0, exports.$split)(pred, xs);
exports.split = split;
