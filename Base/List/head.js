"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.head = exports.$head = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Safely retrieves the first element of a list.
// - xs: The input list.
// = Some x if the list is non-empty (where x is the first element),
//   None if the list is empty.
const $head = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$None;
        case '::':
            return (0, Type_1.$Some)(xs.head);
    }
};
exports.$head = $head;
const head = (xs) => (0, exports.$head)(xs);
exports.head = head;
