"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.and = exports.$and = void 0;
const Type_1 = require("../../Base/Bool/Type");
const foldr_1 = require("../../Base/List/foldr");
const and_1 = require("../../Base/Bool/and");
// Performs the boolean "and" operation between all elements of a list.
// - xs: The input list of boolean values.
// = True if all elements are True, False otherwise.
const $and = (xs) => (0, foldr_1.$foldr)(and_1.$and, Type_1.$True, xs);
exports.$and = $and;
const and = (xs) => (0, exports.$and)(xs);
exports.and = and;
