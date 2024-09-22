"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.tails = exports.$tails = void 0;
const Type_1 = require("../../Base/List/Type");
// Returns all final segments of a list, longest first.
// - xs: The input list.
// = A list of lists, containing all final segments of xs.
const $tails = (xs) => {
    const tail = (xs) => {
        switch (xs.$) {
            case '[]':
                return Type_1.$Nil;
            case '::':
                return (0, Type_1.$Cons)(xs.tail, tail(xs.tail));
        }
    };
    return (0, Type_1.$Cons)(xs, tail(xs));
};
exports.$tails = $tails;
const tails = (xs) => (0, exports.$tails)(xs);
exports.tails = tails;
