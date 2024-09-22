"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.map = exports.$map = void 0;
const Type_1 = require("../../Base/Pair/Type");
const $map = (f, g, pair) => {
    var [x, y] = pair;
    return (0, Type_1.$Sigma)(f(x), g(x, y));
};
exports.$map = $map;
const map = (f) => (g) => (pair) => (0, exports.$map)(f, g, pair);
exports.map = map;
// NOTE: Due to TypeScript's limitations with dependent types,
// we've simplified the function signature. The relationship
// between B and D with respect to A and C is not preserved.
