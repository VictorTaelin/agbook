"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.half = exports.$half = void 0;
const div_1 = require("../../Base/Float/div");
// Halves the given float.
// - x: The number to half.
// = The result of x/2.
const $half = (x) => (0, div_1.$div)(x, 2.0);
exports.$half = $half;
const half = (x) => (0, exports.$half)(x);
exports.half = half;
// NOTE: Using the previously defined div function for consistency with Agda implementation.
