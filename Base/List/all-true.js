"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.all_true = exports.$all_true = void 0;
const foldr_1 = require("../../Base/List/foldr");
const Type_1 = require("../../Base/Bool/Type");
const and_1 = require("../../Base/Bool/and");
// Checks if all elements of a list satisfy a given predicate.
// - p: The predicate function to apply to each element.
// - xs: The input list.
// = True if all elements satisfy the predicate, False otherwise.
const $all_true = (p, xs) => (0, foldr_1.$foldr)((x, acc) => (0, and_1.$and)(p(x), acc), Type_1.$True, xs);
exports.$all_true = $all_true;
const all_true = (p) => (xs) => (0, exports.$all_true)(p, xs);
exports.all_true = all_true;
