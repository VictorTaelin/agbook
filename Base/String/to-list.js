"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_list = exports.$to_list = void 0;
const Type_1 = require("../../Base/List/Type");
// Converts a string to a list of characters.
// - s: The input string.
// = A list of characters representing the string.
const $to_list = (s) => {
    if (s === "") {
        return Type_1.$Nil;
    }
    else {
        var head = s[0];
        var tail = s.slice(1);
        return (0, Type_1.$Cons)(head, (0, exports.$to_list)(tail));
    }
};
exports.$to_list = $to_list;
const to_list = (s) => (0, exports.$to_list)(s);
exports.to_list = to_list;
// NOTE: Using native string operations for efficiency.
