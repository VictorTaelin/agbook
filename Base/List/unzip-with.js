"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.unzip_with = exports.$unzip_with = void 0;
const Type_1 = require("../../Base/List/Type");
// Unzips a list with a given function that generates a pair of lists.
// - f: The function to apply to each element, generating a pair.
// - xs: The input list to unzip.
// = A pair of lists, where the first list contains all first elements of the pairs,
//   and the second list contains all second elements of the pairs.
const $unzip_with = (f, xs) => {
    switch (xs.$) {
        case '[]':
            return [Type_1.$Nil, Type_1.$Nil];
        case '::':
            var [x, y] = f(xs.head);
            var [xs_, ys_] = (0, exports.$unzip_with)(f, xs.tail);
            return [(0, Type_1.$Cons)(x, xs_), (0, Type_1.$Cons)(y, ys_)];
    }
};
exports.$unzip_with = $unzip_with;
const unzip_with = (f) => (xs) => (0, exports.$unzip_with)(f, xs);
exports.unzip_with = unzip_with;
