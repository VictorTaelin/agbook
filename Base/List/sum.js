"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sum = exports.$sum = void 0;
const foldr_1 = require("../../Base/List/foldr");
const Type_1 = require("../../Base/Nat/Type");
const add_1 = require("../../Base/Nat/add");
// Calculates the sum of a list of natural numbers.
// - xs: The input list of natural numbers.
// = The sum of all numbers in the list.
const $sum = (xs) => (0, foldr_1.$foldr)(add_1.$add, Type_1.$Zero, xs);
exports.$sum = $sum;
const sum = (xs) => (0, exports.$sum)(xs);
exports.sum = sum;
