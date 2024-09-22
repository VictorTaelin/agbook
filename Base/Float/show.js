"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show = exports.$show = void 0;
// Converts a Float to its string representation.
// - x: The Float value to be converted.
// = A string representation of the Float.
const $show = (x) => x.toString();
exports.$show = $show;
const show = (x) => (0, exports.$show)(x);
exports.show = show;
// NOTE: Using native JavaScript toString() method for efficiency.
