"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.diagonal = exports.$diagonal = void 0;
const Type_1 = require("../../Base/List/Type");
const append_1 = require("../../Base/List/append");
const foldr_1 = require("../../Base/List/foldr");
const zip_cons_1 = require("../../Base/List/zip-cons");
// Extracts the diagonal elements from a list of lists.
// - xss: The input list of lists.
// = A new list containing the diagonal elements.
const $diagonal = (xss) => {
    // Helper function to create a striped version of the input list of lists.
    // - xss: The input list of lists.
    // = A new list of lists where each sublist contains elements from the diagonal.
    const $stripe = (xss) => {
        switch (xss.$) {
            case '[]':
                return Type_1.$Nil;
            case '::':
                switch (xss.head.$) {
                    case '[]':
                        return $stripe(xss.tail);
                    case '::':
                        return (0, Type_1.$Cons)((0, Type_1.$Cons)(xss.head.head, Type_1.$Nil), (0, zip_cons_1.$zip_cons)(xss.head.tail, $stripe(xss.tail)));
                }
        }
    };
    return (0, foldr_1.$foldr)(append_1.$append, Type_1.$Nil, $stripe(xss));
};
exports.$diagonal = $diagonal;
const diagonal = (xss) => (0, exports.$diagonal)(xss);
exports.diagonal = diagonal;
