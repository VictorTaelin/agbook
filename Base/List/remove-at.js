"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.remove_at = exports.$remove_at = void 0;
const Type_1 = require("../../Base/List/Type");
// Removes the element at the specified index from the list.
// If the index is out of bounds, returns the original list.
// - n: The index of the element to remove.
// - xs: The input list.
// = A new list with the element at index n removed, or the original list if n is out of bounds.
const $remove_at = (xs, n) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Nil;
        case '::':
            if (n === 0n) {
                return xs.tail;
            }
            else {
                return (0, Type_1.$Cons)(xs.head, (0, exports.$remove_at)(xs.tail, n - 1n));
            }
    }
};
exports.$remove_at = $remove_at;
const remove_at = (xs) => (n) => (0, exports.$remove_at)(xs, n);
exports.remove_at = remove_at;
