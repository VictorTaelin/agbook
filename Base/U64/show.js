"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.show = exports.$show = void 0;
const append_1 = require("../../Base/String/append");
const show_1 = require("../../Base/Nat/show");
const to_nat_1 = require("../../Base/U64/to-nat");
// Converts a U64 to its string representation, appending "U" at the end.
const $show = (x) => {
    return (0, append_1.$append)((0, show_1.$show)((0, to_nat_1.$to_nat)(x)), "U");
};
exports.$show = $show;
const show = (x) => (0, exports.$show)(x);
exports.show = show;
// NOTE: Using the composition of $to_nat, nat_show, and string append for the implementation.
