"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show = exports.$show = void 0;
// Converts a Nat (BigInt) to its string representation.
const $show = (n) => n.toString();
exports.$show = $show;
const show = (n) => (0, exports.$show)(n);
exports.show = show;
// NOTE: Using native BigInt.toString() for efficiency.
