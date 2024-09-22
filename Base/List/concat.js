"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.concat = exports.$concat = void 0;
const Type_1 = require("../../Base/List/Type");
const foldr_1 = require("../../Base/List/foldr");
const append_1 = require("../../Base/List/append");
// Concatenates a list of lists into a single list.
// - xss: The input list of lists.
// = A new list containing all elements from all inner lists.
const $concat = (xss) => {
    return (0, foldr_1.$foldr)(append_1.$append, Type_1.$Nil, xss);
};
exports.$concat = $concat;
const concat = (xss) => (0, exports.$concat)(xss);
exports.concat = concat;
