"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sym = exports.$sym = void 0;
const Type_1 = require("../../Base/Equal/Type");
// Symmetry property of equality
// If x is equal to y, then y is equal to x
// - x: The first value
// - y: The second value
// - p: Proof that x is equal to y
// = Proof that y is equal to x
const $sym = (_x, _y, _p) => Type_1.$refl;
exports.$sym = $sym;
const sym = (_x) => (_y) => (_p) => Type_1.$refl;
exports.sym = sym;
