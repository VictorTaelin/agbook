"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mod = exports.$mod = exports.$$mod = exports.mod_aux = exports.$mod_aux = void 0;
// Helper function for modulo operation
// - k: Accumulator for the remainder
// - m: The divisor
// - n: The remaining dividend
// - j: Counter for the divisor
// = The remainder of the division
const $mod_aux = (k, m, n, j) => {
    if (n === 0n) {
        return k;
    }
    else if (j === 0n) {
        return (0, exports.$mod_aux)(0n, m, n - 1n, m);
    }
    else {
        return (0, exports.$mod_aux)(k + 1n, m, n - 1n, j - 1n);
    }
};
exports.$mod_aux = $mod_aux;
const mod_aux = (k) => (m) => (n) => (j) => (0, exports.$mod_aux)(k, m, n, j);
exports.mod_aux = mod_aux;
// Performs natural number modulo operation
// - n: The dividend
// - m: The divisor
// = The remainder of n divided by m
const $$mod = (n, m) => {
    if (m === 0n) {
        return 0n; // Modulo by zero returns zero
    }
    else {
        return (0, exports.$mod_aux)(0n, m - 1n, n, m - 1n);
    }
};
exports.$$mod = $$mod;
// NOTE: Native BigInt modulo used for efficiency
const $mod = (n, m) => m === 0n ? 0n : n % m;
exports.$mod = $mod;
const mod = (n) => (m) => (0, exports.$mod)(n, m);
exports.mod = mod;
// NOTE: Operator omitted: '_%_'.
