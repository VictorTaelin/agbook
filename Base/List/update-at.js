"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.update_at = exports.$update_at = void 0;
const Type_1 = require("../../Base/List/Type");
// Updates an element at a specific index in a list.
// If the index is out of bounds, the original list is returned.
// - xs: The input list.
// - n: The index at which to update the element.
// - f: The function to apply to the element at the specified index.
// = A new list with the element at index n updated, or the original list if n is out of bounds.
const $update_at = (xs, n, f) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Nil;
        case '::':
            if (n === 0n) {
                return (0, Type_1.$Cons)(f(xs.head), xs.tail);
            }
            else {
                return (0, Type_1.$Cons)(xs.head, (0, exports.$update_at)(xs.tail, n - 1n, f));
            }
    }
};
exports.$update_at = $update_at;
const update_at = (xs) => (n) => (f) => (0, exports.$update_at)(xs, n, f);
exports.update_at = update_at;
