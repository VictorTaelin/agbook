"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show_rev = exports.$show_rev = void 0;
const reverse_1 = require("../../Base/Bits/reverse");
const append_1 = require("../../Base/String/append");
// Converts Bits to string with less significant values to the right.
// - bits: The Bits value to reverse and convert.
// = A string representation of the reversed Bits value.
const $show_rev = (bits) => {
    const go = (bits) => {
        switch (bits.$) {
            case 'E':
                return "";
            case 'O':
                return (0, append_1.$append)("0", go(bits.tail));
            case 'I':
                return (0, append_1.$append)("1", go(bits.tail));
        }
    };
    return go((0, reverse_1.$reverse)(bits));
};
exports.$show_rev = $show_rev;
const show_rev = (bits) => (0, exports.$show_rev)(bits);
exports.show_rev = show_rev;
