"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.zip_with = exports.$zip_with = void 0;
const Type_1 = require("../../Base/List/Type");
// Zips two lists into a single list using a combining function.
// - f: The function to combine elements from both lists.
// - xs: The first input list.
// - ys: The second input list.
// = A new list where each element is the result of applying f to
//   corresponding elements from xs and ys.
const $zip_with = (f, xs, ys) => {
    if (xs.$ === '::' && ys.$ === '::') {
        return (0, Type_1.$Cons)(f(xs.head, ys.head), (0, exports.$zip_with)(f, xs.tail, ys.tail));
    }
    else {
        return Type_1.$Nil;
    }
};
exports.$zip_with = $zip_with;
const zip_with = (f) => (xs) => (ys) => (0, exports.$zip_with)(f, xs, ys);
exports.zip_with = zip_with;
