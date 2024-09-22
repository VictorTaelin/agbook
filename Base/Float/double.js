"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.double = exports.$double = void 0;
const add_1 = require("../../Base/Float/add");
// Doubles a float.
// - x: The number to double.
// = The double of x.
const $double = (x) => (0, add_1.$add)(x, x);
exports.$double = $double;
const double = (x) => (0, exports.$double)(x);
exports.double = double;
// NOTE: For efficiency, we could use native multiplication: x * 2
// However, we're preserving the original algorithm as specified in Agda.
