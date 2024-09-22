"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.tail = exports.$tail = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Safely retrieves all elements of a list except the first one.
// - xs: The input list.
// = Some ys if the list is non-empty (where ys is the list without its first element),
//   None if the list is empty.
const $tail = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$None;
        case '::':
            return (0, Type_1.$Some)(xs.tail);
    }
};
exports.$tail = $tail;
const tail = (xs) => (0, exports.$tail)(xs);
exports.tail = tail;
