"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = exports.$$eq = void 0;
// Checks if two boolean values are equal.
// - x: The first boolean value.
// - y: The second boolean value.
// = True if x and y are equal, False otherwise.
const $$eq = (x, y) => {
    if (x) {
        if (y) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        if (y) {
            return false;
        }
        else {
            return true;
        }
    }
};
exports.$$eq = $$eq;
// NOTE: Using native boolean equality for efficiency.
const $eq = (x, y) => x === y;
exports.$eq = $eq;
const eq = (x) => (y) => x === y;
exports.eq = eq;
// NOTE: Operator omitted: '_==_'.
