"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.get_fst = exports.$get_fst = void 0;
// Gets the first element of a Sigma (dependent pair) type.
// - pair: The input Sigma pair.
// = The first element of the pair.
const $get_fst = (pair) => pair[0];
exports.$get_fst = $get_fst;
const get_fst = (pair) => pair[0];
exports.get_fst = get_fst;
