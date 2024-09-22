"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$from_char = exports.from_char = exports.$from_char = void 0;
const Type_1 = require("../../Base/List/Type");
const from_list_1 = require("../../Base/String/from-list");
// Converts a character to a string
const $from_char = (c) => {
    return (0, from_list_1.$from_list)((0, Type_1.$Cons)(c, Type_1.$Nil));
};
exports.$from_char = $from_char;
const from_char = (c) => (0, exports.$from_char)(c);
exports.from_char = from_char;
// NOTE: For efficiency, we can directly return the character as a string
// since we're using native string representation for both Char and String.
const $$from_char = (c) => c;
exports.$$from_char = $$from_char;
