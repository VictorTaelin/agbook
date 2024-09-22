"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.replicate = exports.$replicate = void 0;
const Type_1 = require("../../Base/List/Type");
const Type_2 = require("../../Base/Nat/Type");
// Replicates a value n times to create a list.
// - n: The number of times to replicate the value.
// - x: The value to replicate.
// = A list consisting of n repetitions of x.
const $replicate = (n, x) => {
    if (n === Type_2.$Zero) {
        return Type_1.$Nil;
    }
    else {
        var pred = n - 1n;
        return (0, Type_1.$Cons)(x, (0, exports.$replicate)(pred, x));
    }
};
exports.$replicate = $replicate;
const replicate = (n) => (x) => (0, exports.$replicate)(n, x);
exports.replicate = replicate;
