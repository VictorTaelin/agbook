"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.filter = exports.$filter = void 0;
const Type_1 = require("../../Base/List/Type");
// Filters a list based on a predicate function.
// - fn: The function used to test each element.
// - xs: The input list.
// = A new list containing only elements that satisfy the predicate.
const $filter = (fn, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Nil;
        case '::':
            var result = fn(xs.head);
            if (result) {
                return (0, Type_1.$Cons)(xs.head, (0, exports.$filter)(fn, xs.tail));
            }
            else {
                return (0, exports.$filter)(fn, xs.tail);
            }
    }
};
exports.$filter = $filter;
const filter = (fn) => (xs) => (0, exports.$filter)(fn, xs);
exports.filter = filter;
