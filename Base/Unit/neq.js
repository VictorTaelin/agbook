"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.neq = exports.$neq = void 0;
const Type_1 = require("../../Base/Bool/Type");
// Checks if two Unit values are not equal.
// Always returns False since there's only one Unit value.
// - a: The first Unit value.
// - b: The second Unit value.
// = Always False.
const $neq = (a, b) => Type_1.False;
exports.$neq = $neq;
const neq = (a) => (b) => Type_1.False;
exports.neq = neq;
// NOTE: Operator omitted: '_!=_'.
