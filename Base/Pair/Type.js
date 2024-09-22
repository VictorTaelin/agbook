"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Pair = exports.$Pair = exports.Σ = exports.Sigma = exports.$Sigma = void 0;
// Constructor for Sigma
const $Sigma = (fst, snd) => [fst, snd];
exports.$Sigma = $Sigma;
const Sigma = (fst) => (snd) => (0, exports.$Sigma)(fst, snd);
exports.Sigma = Sigma;
// Σ as a synonym for Sigma
exports.Σ = exports.Sigma;
// Constructor for Pair
const $Pair = (fst, snd) => [fst, snd];
exports.$Pair = $Pair;
const Pair = (fst) => (snd) => (0, exports.$Pair)(fst, snd);
exports.Pair = Pair;
// NOTE: TypeScript doesn't have a direct equivalent for dependent types,
// so we're using a simplified representation for Sigma and Pair.
// Both are compiled to simple pairs [A, B].
