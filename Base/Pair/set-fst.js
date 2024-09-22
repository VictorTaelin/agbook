"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.set_fst = exports.$set_fst = void 0;
// Sets the first element of a pair to a new value.
// - z: The new value for the first element.
// - pair: The original pair.
// = A new pair with the first element replaced by z.
const $set_fst = (z, pair) => {
    const [_, y] = pair;
    return [z, y];
};
exports.$set_fst = $set_fst;
const set_fst = (z) => (pair) => (0, exports.$set_fst)(z, pair);
exports.set_fst = set_fst;
