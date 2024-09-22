"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.append = exports.$append = void 0;
// Concatenates two strings.
// - s1: The first string.
// - s2: The second string.
// = The concatenation of s1 and s2.
const $append = (s1, s2) => s1 + s2;
exports.$append = $append;
const append = (s1) => (s2) => s1 + s2;
exports.append = append;
// NOTE: Using native string concatenation for efficiency.
// NOTE: Operator omitted: '_++_'.
