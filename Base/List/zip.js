"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.zip = exports.$zip = void 0;
const zip_with_1 = require("../../Base/List/zip-with");
// Zips two lists into a single list of pairs.
// - xs: The first input list.
// - ys: The second input list.
// = A new list where each element is a pair of corresponding elements from xs and ys.
const $zip = (xs, ys) => (0, zip_with_1.$zip_with)((a, b) => [a, b], xs, ys);
exports.$zip = $zip;
const zip = (xs) => (ys) => (0, exports.$zip)(xs, ys);
exports.zip = zip;
