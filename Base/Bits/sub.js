"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sub = exports.$sub = void 0;
const Type_1 = require("../../Base/Bits/Type");
const dec_1 = require("../../Base/Bits/dec");
// Performs subtraction of two Bits values.
// - a: The 1st Bits value (minuend).
// - b: The 2nd Bits value (subtrahend).
// = A new Bits value representing the difference of a and b.
const $sub = (a, b) => {
    switch (a.$) {
        case 'E':
            return Type_1.$E;
        case 'O':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                    return (0, Type_1.$O)((0, exports.$sub)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.$I)((0, dec_1.$dec)((0, exports.$sub)(a.tail, b.tail)));
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                    return (0, Type_1.$I)((0, exports.$sub)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.$O)((0, exports.$sub)(a.tail, b.tail));
            }
    }
};
exports.$sub = $sub;
const sub = (a) => (b) => (0, exports.$sub)(a, b);
exports.sub = sub;
// NOTE: Operator omitted: '_-_'.
