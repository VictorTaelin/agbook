"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_u64 = exports.$from_u64 = void 0;
const to_nat_1 = require("../../Base/U64/to-nat");
// Converts a U64 to a Float
// - x: The U64 to convert.
// = The Float representation of x.
const $from_u64 = (x) => {
    return Number((0, to_nat_1.$to_nat)(x));
};
exports.$from_u64 = $from_u64;
const from_u64 = (x) => (0, exports.$from_u64)(x);
exports.from_u64 = from_u64;
// NOTE: We first convert U64 to Nat using to_nat, then use JavaScript's Number() function
// to convert the BigInt to a floating-point number.
