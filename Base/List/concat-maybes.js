"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.concat_maybes = exports.$concat_maybes = void 0;
const Type_1 = require("../../Base/List/Type");
const foldr_1 = require("../../Base/List/foldr");
// Concatenates all of the `Some` values in a list of Maybe.
// - xs: The input list of Maybe values.
// = A new list containing all the values from `Some` constructors.
const $concat_maybes = (xs) => {
    const go = (maybe_a, acc) => {
        switch (maybe_a.$) {
            case 'None':
                return acc;
            case 'Some':
                return (0, Type_1.$Cons)(maybe_a.value, acc);
        }
    };
    return (0, foldr_1.$foldr)(go, Type_1.$Nil, xs);
};
exports.$concat_maybes = $concat_maybes;
const concat_maybes = (xs) => (0, exports.$concat_maybes)(xs);
exports.concat_maybes = concat_maybes;
