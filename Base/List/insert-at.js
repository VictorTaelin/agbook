"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.insert_at = exports.$insert_at = void 0;
const Type_1 = require("../../Base/List/Type");
// Inserts an element at a specific index in a list.
// If the index is out of bounds, the element is appended to the end of the list.
// - n: The index at which to insert the element.
// - x: The element to insert.
// - xs: The input list.
// = A new list with the element inserted at the specified index.
const $insert_at = (xs, n, v) => {
    if (n === 0n) {
        return (0, Type_1.$Cons)(v, xs);
    }
    else {
        switch (xs.$) {
            case '[]':
                return (0, Type_1.$Cons)(v, Type_1.$Nil);
            case '::':
                return (0, Type_1.$Cons)(xs.head, (0, exports.$insert_at)(xs.tail, n - 1n, v));
        }
    }
};
exports.$insert_at = $insert_at;
const insert_at = (xs) => (n) => (v) => (0, exports.$insert_at)(xs, n, v);
exports.insert_at = insert_at;
