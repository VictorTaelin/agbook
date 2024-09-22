"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.append = exports.$append = void 0;
const Type_1 = require("../../Base/List/Type");
// Appends two lists.
// Returns a new list containing all elements from both input lists.
const $append = (xs, ys) => {
    switch (xs.$) {
        case '[]':
            return ys;
        case '::':
            return (0, Type_1.$Cons)(xs.head, (0, exports.$append)(xs.tail, ys));
    }
};
exports.$append = $append;
const append = (xs) => (ys) => (0, exports.$append)(xs, ys);
exports.append = append;
// NOTE: Operator omitted: '_++_'.
