"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.negate = exports.$negate = void 0;
// Negates a float 
// - x: The float to negate
// = The negated value of x
const $negate = (x) => -x;
exports.$negate = $negate;
const negate = (x) => (0, exports.$negate)(x);
exports.negate = negate;
// NOTE: Using native JavaScript negation operator for efficiency.
