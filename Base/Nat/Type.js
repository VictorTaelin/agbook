"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Succ = exports.$Succ = exports.Zero = exports.$Zero = void 0;
exports.$Zero = 0n;
exports.Zero = exports.$Zero;
const $Succ = (n) => 1n + n;
exports.$Succ = $Succ;
const Succ = (n) => (0, exports.$Succ)(n);
exports.Succ = Succ;
// NOTE: Using native BigInt to represent Nat for efficiency.
// The original Agda constructors are preserved as functions.
