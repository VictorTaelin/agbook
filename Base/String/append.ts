import { String } from '../../Base/String/Type';

// Concatenates two strings.
// - s1: The first string.
// - s2: The second string.
// = The concatenation of s1 and s2.
export const $append = (s1: String, s2: String): String => s1 + s2;
export const  append = (s1: String) => (s2: String) => s1 + s2;

// NOTE: Using native JavaScript string concatenation for efficiency.
// NOTE: Operator omitted: '_++_'.