"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.square = exports.$square = void 0;
const mul_1 = require("../../Base/Float/mul");
// Squares a float.
// - x: The number to square.
// = The square of x (x^2).
const $square = (x) => (0, mul_1.$mul)(x, x);
exports.$square = $square;
const square = (x) => (0, exports.$square)(x);
exports.square = square;
