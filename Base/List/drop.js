"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.drop = exports.$drop = void 0;
const Type_1 = require("../../Base/List/Type");
// Drops the first n elements from a list.
// Returns the list without its first n elements.
const $drop = (n, xs) => {
    if (n === 0n) {
        return xs;
    }
    else {
        switch (xs.$) {
            case '[]':
                return Type_1.$Nil;
            case '::':
                return (0, exports.$drop)(n - 1n, xs.tail);
        }
    }
};
exports.$drop = $drop;
const drop = (n) => (xs) => (0, exports.$drop)(n, xs);
exports.drop = drop;
