"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.split_at = exports.$split_at = void 0;
const Type_1 = require("../../Base/Pair/Type");
const Type_2 = require("../../Base/Bits/Type");
const pad_zeros_1 = require("../../Base/Bits/pad-zeros");
// Collects the first `m` bits of `bits` into the `fst` and the rest into the `snd`.
const $split_at = (n, bits) => {
    if (n === 0n) {
        return (0, Type_1.$Pair)(Type_2.$E, bits);
    }
    else {
        var n_ = n - 1n;
        switch (bits.$) {
            case 'E':
                return (0, Type_1.$Pair)((0, pad_zeros_1.$pad_zeros)(n_, Type_2.$E), Type_2.$E);
            case 'O': {
                var split = (0, exports.$split_at)(n_, bits.tail);
                return (0, Type_1.$Pair)((0, Type_2.$O)(split[0]), split[1]);
            }
            case 'I': {
                var split = (0, exports.$split_at)(n_, bits.tail);
                return (0, Type_1.$Pair)((0, Type_2.$I)(split[0]), split[1]);
            }
        }
    }
};
exports.$split_at = $split_at;
const split_at = (n) => (bits) => (0, exports.$split_at)(n, bits);
exports.split_at = split_at;
