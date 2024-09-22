"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.iterate = exports.$iterate = void 0;
const Type_1 = require("../../Base/List/Type");
const Type_2 = require("../../Base/Nat/Type");
// Generates a list by iterating a function over an initial value.
// - f: The function to be applied repeatedly.
// - x: The initial value.
// - n: The number of iterations.
// = A list containing the results of applying f repeatedly, n times.
const $iterate = (f, x, n) => {
    if (n === Type_2.$Zero) {
        return Type_1.$Nil;
    }
    else {
        var pred = n - 1n;
        return (0, Type_1.$Cons)(x, (0, exports.$iterate)(f, f(x), pred));
    }
};
exports.$iterate = $iterate;
const iterate = (f) => (x) => (n) => (0, exports.$iterate)(f, x, n);
exports.iterate = iterate;
