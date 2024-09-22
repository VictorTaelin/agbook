"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_bool = exports.$from_bool = void 0;
const from_nat_1 = require("../../Base/U64/from-nat");
// Converts a Bool to a U64 number.
// - b: The input Bool value.
// = The corresponding U64 value (1 for True, 0 for False).
const $from_bool = (b) => {
    if (b) {
        return (0, from_nat_1.$from_nat)(1n);
    }
    else {
        return (0, from_nat_1.$from_nat)(0n);
    }
};
exports.$from_bool = $from_bool;
const from_bool = (b) => (0, exports.$from_bool)(b);
exports.from_bool = from_bool;
// NOTE: Using native boolean check for efficiency.
