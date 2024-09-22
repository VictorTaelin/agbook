"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.insert_at_sorted = exports.$insert_at_sorted = void 0;
const Type_1 = require("../../Base/List/Type");
// Inserts an element into a sorted list, maintaining the sort order.
// - leq: The less-than-or-equal comparison function.
// - x: The element to insert.
// - xs: The sorted input list.
// = A new sorted list with x inserted in the correct position.
const $insert_at_sorted = (leq, x, xs) => {
    switch (xs.$) {
        case '[]':
            return (0, Type_1.$Cons)(x, Type_1.$Nil);
        case '::':
            var y = xs.head;
            var ys = xs.tail;
            if (leq(x, y)) {
                return (0, Type_1.$Cons)(x, xs);
            }
            else {
                return (0, Type_1.$Cons)(y, (0, exports.$insert_at_sorted)(leq, x, ys));
            }
    }
};
exports.$insert_at_sorted = $insert_at_sorted;
const insert_at_sorted = (leq) => (x) => (xs) => (0, exports.$insert_at_sorted)(leq, x, xs);
exports.insert_at_sorted = insert_at_sorted;
