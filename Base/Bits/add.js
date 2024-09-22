"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.add = exports.$add = void 0;
const Type_1 = require("../../Base/Bits/Type");
const inc_1 = require("../../Base/Bits/inc");
// Performs addition of two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the sum of a and b.
const $add = (a, b) => {
    switch (a.$) {
        case 'E':
            return b;
        case 'O':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                    return (0, Type_1.O)((0, exports.$add)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.I)((0, exports.$add)(a.tail, b.tail));
            }
        case 'I':
            switch (b.$) {
                case 'E':
                    return a;
                case 'O':
                    return (0, Type_1.I)((0, exports.$add)(a.tail, b.tail));
                case 'I':
                    return (0, Type_1.O)((0, inc_1.$inc)((0, exports.$add)(a.tail, b.tail)));
            }
    }
};
exports.$add = $add;
const add = (a) => (b) => (0, exports.$add)(a, b);
exports.add = add;
// NOTE: Operator omitted: '_+_'.
