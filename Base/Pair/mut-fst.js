"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mut_fst = exports.$mut_fst = void 0;
// Mutates the first element of a pair
// - f: A function to apply to the first element
// - pair: The input pair
// = A new pair with the first element transformed by f
const $mut_fst = (f, pair) => {
    const [x, y] = pair;
    return [f(x), y];
};
exports.$mut_fst = $mut_fst;
const mut_fst = (f) => (pair) => (0, exports.$mut_fst)(f, pair);
exports.mut_fst = mut_fst;
