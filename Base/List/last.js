"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.last = exports.$last = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Safely retrieves the last element of a list.
// - xs: The input list.
// = Some x if the list is non-empty (where x is the last element),
//   None if the list is empty.
const $last = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$None;
        case '::':
            if (xs.tail.$ === '[]') {
                return (0, Type_1.$Some)(xs.head);
            }
            else {
                return (0, exports.$last)(xs.tail);
            }
    }
};
exports.$last = $last;
const last = (xs) => (0, exports.$last)(xs);
exports.last = last;
