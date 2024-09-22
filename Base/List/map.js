"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.map = exports.$map = void 0;
const Type_1 = require("../../Base/List/Type");
// Applies a function to each element of a list.
// - fn: The function to be applied.
// - xs: The elements to apply f to.
// = A new list with f applied to all elements.
const $map = (fn, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Nil;
        case '::':
            return (0, Type_1.$Cons)(fn(xs.head), (0, exports.$map)(fn, xs.tail));
    }
};
exports.$map = $map;
const map = (fn) => (xs) => (0, exports.$map)(fn, xs);
exports.map = map;
