"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.length = exports.$length = exports.$$length = void 0;
const Type_1 = require("../../Base/Nat/Type");
// Returns the length of a Bits structure, that is, how many bits it has.
const $$length = (bits) => {
    switch (bits.$) {
        case 'E':
            return Type_1.$Zero;
        case 'O':
        case 'I':
            return (0, Type_1.$Succ)((0, exports.$$length)(bits.tail));
    }
};
exports.$$length = $$length;
// NOTE: Using native BigInt operations for efficiency
const $length = (bits) => {
    var len = 0n;
    while (bits.$ !== 'E') {
        len += 1n;
        bits = bits.tail;
    }
    return len;
};
exports.$length = $length;
const length = (bits) => (0, exports.$length)(bits);
exports.length = length;
