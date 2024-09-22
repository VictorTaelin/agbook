"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_cons = exports.$is_cons = void 0;
const Type_1 = require("../../Base/Bool/Type");
// Checks if a list is non-empty (cons).
// - xs: The list to check.
// = True if the list is non-empty, False otherwise.
const $is_cons = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$False;
        case '::':
            return Type_1.$True;
    }
};
exports.$is_cons = $is_cons;
const is_cons = (xs) => (0, exports.$is_cons)(xs);
exports.is_cons = is_cons;
