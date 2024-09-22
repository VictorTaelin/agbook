"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$sub = exports.sub = exports.$sub = void 0;
const sub_1 = require("../../Base/Nat/sub");
const add_1 = require("../../Base/Nat/add");
const to_nat_1 = require("../../Base/U64/to-nat");
const from_nat_1 = require("../../Base/U64/from-nat");
// Subtracts one U64 from another.
// - a: The U64 to subtract from.
// - b: The U64 to subtract.
// = The result of a - b, wrapping around if b > a.
const $sub = (a, b) => {
    const max_u64 = 18446744073709551616n;
    return (0, from_nat_1.$from_nat)((0, sub_1.$sub)((0, add_1.$add)((0, to_nat_1.$to_nat)(a), max_u64), (0, to_nat_1.$to_nat)(b)));
};
exports.$sub = $sub;
const sub = (a) => (b) => (0, exports.$sub)(a, b);
exports.sub = sub;
// NOTE: Operator '_-_' omitted.
// For efficiency, we also provide a native implementation:
const $$sub = (a, b) => {
    return BigInt.asUintN(64, a - b);
};
exports.$$sub = $$sub;
