"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_nil = exports.$is_nil = void 0;
const Type_1 = require("../../Base/Bool/Type");
// Checks if a list is empty (nil).
// - xs: The list to check.
// = True if the list is empty, False otherwise.
const $is_nil = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$True;
        case '::':
            return Type_1.$False;
    }
};
exports.$is_nil = $is_nil;
const is_nil = (xs) => (0, exports.$is_nil)(xs);
exports.is_nil = is_nil;
