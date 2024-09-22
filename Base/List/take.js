"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.take = exports.$take = exports.$$take = void 0;
const Type_1 = require("../../Base/List/Type");
// Takes the first n elements from a list.
// If n is greater than the length of the list, returns the entire list.
// - n: The number of elements to take.
// - xs: The input list.
// = A list containing the first n elements of xs, or all of xs if n > length xs.
const $$take = (n, xs) => {
    if (n === 0n) {
        return Type_1.$Nil;
    }
    else {
        var pred = n - 1n;
        switch (xs.$) {
            case '[]':
                return Type_1.$Nil;
            case '::':
                return (0, Type_1.$Cons)(xs.head, (0, exports.$$take)(pred, xs.tail));
        }
    }
};
exports.$$take = $$take;
// NOTE: Using more efficient implementation
const $take = (n, xs) => {
    if (n === 0n) {
        return Type_1.$Nil;
    }
    else {
        switch (xs.$) {
            case '[]':
                return Type_1.$Nil;
            case '::':
                return (0, Type_1.$Cons)(xs.head, (0, exports.$take)(n - 1n, xs.tail));
        }
    }
};
exports.$take = $take;
const take = (n) => (xs) => (0, exports.$take)(n, xs);
exports.take = take;
