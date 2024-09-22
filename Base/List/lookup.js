"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lookup = exports.$lookup = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Retrieves the element at the specified index in the list.
// - xs: The input list.
// - i: The index to retrieve.
// = Just the element at index i if i < length xs, otherwise None.
const $lookup = (xs, i) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$None;
        case '::':
            if (i === 0n) {
                return (0, Type_1.$Some)(xs.head);
            }
            else {
                return (0, exports.$lookup)(xs.tail, i - 1n);
            }
    }
};
exports.$lookup = $lookup;
const lookup = (xs) => (i) => (0, exports.$lookup)(xs, i);
exports.lookup = lookup;
