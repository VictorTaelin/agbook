"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.product = exports.$product = void 0;
const foldr_1 = require("../../Base/List/foldr");
const mul_1 = require("../../Base/Nat/mul");
// Calculates the product of a list of natural numbers.
// - xs: The input list of natural numbers.
// = The product of all numbers in the list.
const $product = (xs) => (0, foldr_1.$foldr)(mul_1.$mul, 1n, xs);
exports.$product = $product;
const product = (xs) => (0, exports.$product)(xs);
exports.product = product;
