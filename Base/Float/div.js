"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.div = exports.$div = void 0;
// Division of floats.
// - x: The dividend.
// - y: The divisor.
// = The quotient of x divided by y.
const $div = (x, y) => x / y;
exports.$div = $div;
const div = (x) => (y) => x / y;
exports.div = div;
// NOTE: Using native JavaScript division operator for efficiency.
// NOTE: Operator '_/_' omitted in TypeScript.
