"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.gte = exports.$gte = void 0;
const to_nat_1 = require("../../Base/Char/to-nat");
const gte_1 = require("../../Base/Nat/gte");
// Checks if one character is greater than or equal to another.
// - x: The first character.
// - y: The second character.
// = True if x is greater than or equal to y, False otherwise.
const $gte = (x, y) => {
    return (0, gte_1.$gte)((0, to_nat_1.$to_nat)(x), (0, to_nat_1.$to_nat)(y));
};
exports.$gte = $gte;
const gte = (x) => (y) => (0, exports.$gte)(x, y);
exports.gte = gte;
// NOTE: Operator omitted: '_>=_'
// NOTE: For efficiency, we could use native string comparison:
// export const $gte = (x: Char, y: Char): Bool => x >= y;
// However, we're keeping the original algorithm to maintain consistency with Agda.
