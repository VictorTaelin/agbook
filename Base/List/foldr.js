"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.foldr = exports.$foldr = void 0;
// Performs a right fold over a list.
// - f: The combining function.
// - z: The initial value (for the empty list case).
// - xs: The list to fold over.
// = The result of folding the list.
const $foldr = (f, z, xs) => {
    switch (xs.$) {
        case '[]':
            return z;
        case '::':
            return f(xs.head, (0, exports.$foldr)(f, z, xs.tail));
    }
};
exports.$foldr = $foldr;
const foldr = (f) => (z) => (xs) => (0, exports.$foldr)(f, z, xs);
exports.foldr = foldr;
