"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.unzip = exports.$unzip = void 0;
const unzip_with_1 = require("../../Base/List/unzip-with");
// Unzips a list of pairs into two separate lists.
// - xs: The input list of pairs to unzip.
// = A pair of lists, where the first list contains all first elements of the pairs,
//   and the second list contains all second elements of the pairs.
const $unzip = (xs) => {
    return (0, unzip_with_1.$unzip_with)((x) => x, xs);
};
exports.$unzip = $unzip;
const unzip = (xs) => (0, exports.$unzip)(xs);
exports.unzip = unzip;
