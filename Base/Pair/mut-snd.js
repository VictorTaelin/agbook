"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mut_snd = exports.$mut_snd = void 0;
const $mut_snd = (f, pair) => {
    const [x, y] = pair;
    return [x, f(y)];
};
exports.$mut_snd = $mut_snd;
const mut_snd = (f) => (pair) => (0, exports.$mut_snd)(f, pair);
exports.mut_snd = mut_snd;
// NOTE: The function name is changed from 'mut-snd' to 'mut_snd' to comply with TypeScript naming conventions.
