"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$length = exports.length = exports.$length = void 0;
const Type_1 = require("../../Base/Nat/Type");
// Computes the length of a list.
// - xs: The input list.
// = The number of elements in the list.
const $length = (xs) => {
    switch (xs.$) {
        case '[]':
            return Type_1.$Zero;
        case '::':
            return (0, Type_1.$Succ)((0, exports.$length)(xs.tail));
    }
};
exports.$length = $length;
const length = (xs) => (0, exports.$length)(xs);
exports.length = length;
// NOTE: Using native BigInt operations for efficiency
const $$length = (xs) => {
    var len = 0n;
    var current = xs;
    while (current.$ === '::') {
        len += 1n;
        current = current.tail;
    }
    return len;
};
exports.$$length = $$length;
