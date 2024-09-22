"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.concat_map = exports.$concat_map = void 0;
const concat_1 = require("../../Base/List/concat");
const map_1 = require("../../Base/List/map");
// Maps elements of a list to lists and concatenates the results.
// - f: The function that maps elements to lists.
// - xs: The input list.
// = A new list containing all elements from the lists produced by f.
const $concat_map = (f, xs) => {
    return (0, concat_1.$concat)((0, map_1.$map)(f, xs));
};
exports.$concat_map = $concat_map;
const concat_map = (f) => (xs) => (0, exports.$concat_map)(f, xs);
exports.concat_map = concat_map;
