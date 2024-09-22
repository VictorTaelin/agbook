"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.head = exports.$head = exports.$$head = void 0;
const Type_1 = require("../../Base/Maybe/Type");
// Retrieves the first character of a string.
// - s: The input string.
// = Some c if the string is non-empty (where c is the first character),
//   None if the string is empty.
const $$head = (s) => {
    if (s === "") {
        return Type_1.None;
    }
    else {
        var head = s[0];
        return (0, Type_1.Some)(head);
    }
};
exports.$$head = $$head;
// NOTE: Using native string operations for efficiency.
const $head = (s) => s === "" ? Type_1.None : (0, Type_1.Some)(s[0]);
exports.$head = $head;
const head = (s) => (0, exports.$head)(s);
exports.head = head;
