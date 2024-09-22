"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.drop_while = exports.$drop_while = void 0;
const Type_1 = require("../../Base/Bool/Type");
const Type_2 = require("../../Base/List/Type");
// Drops elements from the front of the list as long as they satisfy the predicate.
// - fn: The predicate function.
// - xs: The input list.
// = A list containing the remaining elements after dropping the longest prefix of xs of elements that satisfy fn.
const $drop_while = (fn, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_2.$Nil;
        case '::':
            if (fn(xs.head) === Type_1.$True) {
                return (0, exports.$drop_while)(fn, xs.tail);
            }
            else {
                return xs;
            }
    }
};
exports.$drop_while = $drop_while;
const drop_while = (fn) => (xs) => (0, exports.$drop_while)(fn, xs);
exports.drop_while = drop_while;
