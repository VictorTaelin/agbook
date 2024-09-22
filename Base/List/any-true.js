"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.any_true = exports.$any_true = void 0;
const foldr_1 = require("../../Base/List/foldr");
const Type_1 = require("../../Base/Bool/Type");
const or_1 = require("../../Base/Bool/or");
// Checks if any element of a list satisfies a given predicate.
// - p: The predicate function to apply to each element.
// - xs: The input list.
// = True if any element satisfies the predicate, False otherwise.
const $any_true = (p, xs) => (0, foldr_1.$foldr)((x, acc) => (0, or_1.$or)(p(x), acc), Type_1.$False, xs);
exports.$any_true = $any_true;
const any_true = (p) => (xs) => (0, exports.$any_true)(p, xs);
exports.any_true = any_true;
