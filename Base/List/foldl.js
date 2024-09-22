"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.foldl = exports.$foldl = exports.$$foldl = void 0;
// Performs a left fold over a list.
// - f: The combining function.
// - z: The initial value (for the empty list case).
// - xs: The list to fold over.
// = The result of folding the list.
const $$foldl = (f, z, xs) => {
    switch (xs.$) {
        case '[]':
            return z;
        case '::':
            return (0, exports.$$foldl)(f, f(z, xs.head), xs.tail);
    }
};
exports.$$foldl = $$foldl;
// NOTE: Using a loop to emulate strict tail calls with foldl.
const $foldl = (f, z, xs) => {
    var acc = z;
    var current = xs;
    while (current.$ === '::') {
        acc = f(acc, current.head);
        current = current.tail;
    }
    return acc;
};
exports.$foldl = $foldl;
const foldl = (f) => (z) => (xs) => (0, exports.$foldl)(f, z, xs);
exports.foldl = foldl;
