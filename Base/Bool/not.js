"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.not = exports.$not = exports.$$not = void 0;
// Negates a Boolean value.
// - b: The input Boolean value.
// = The negation of the input.
const $$not = (b) => {
    if (b) {
        return false;
    }
    else {
        return true;
    }
};
exports.$$not = $$not;
// NOTE: Using native boolean NOT for efficiency.
const $not = (b) => !b;
exports.$not = $not;
const not = (b) => !b;
exports.not = not;
// NOTE: Operator omitted: '!_'.
