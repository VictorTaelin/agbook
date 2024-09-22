"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.reverse = exports.$reverse = void 0;
const Type_1 = require("../../Base/List/Type");
const foldl_1 = require("../../Base/List/foldl");
// Reverses a list.
// - xs: The input list.
// = A new list containing all elements from the input list in reverse order.
const $reverse = (xs) => {
    return (0, foldl_1.$foldl)((acc, x) => (0, Type_1.$Cons)(x, acc), Type_1.$Nil, xs);
};
exports.$reverse = $reverse;
const reverse = (xs) => (0, exports.$reverse)(xs);
exports.reverse = reverse;
