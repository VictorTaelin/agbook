"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.take_while = exports.$take_while = void 0;
const Type_1 = require("../../Base/List/Type");
// Takes elements from the front of the list as long as they satisfy the predicate.
// - fn: The predicate function.
// - xs: The input list.
// = A list containing the longest prefix of xs of elements that satisfy p.
const $take_while = (fn, xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Nil;
        case '::':
            if (fn(xs.head)) {
                return (0, Type_1.$Cons)(xs.head, (0, exports.$take_while)(fn, xs.tail));
            }
            else {
                return Type_1.$Nil;
            }
    }
};
exports.$take_while = $take_while;
const take_while = (fn) => (xs) => (0, exports.$take_while)(fn, xs);
exports.take_while = take_while;
