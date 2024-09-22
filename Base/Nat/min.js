"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$min = exports.min = exports.$min = void 0;
const if_1 = require("../../Base/Bool/if");
const Ord_1 = require("../../Base/Nat/Trait/Ord");
const Ord_2 = require("../../Base/Trait/Ord");
// Returns the minimum of two natural numbers.
// - x: The first natural number.
// - y: The second natural number.
// = The smaller of x and y.
const $min = (x, y) => {
    return (0, if_1.$if_then_else_)((0, Ord_2.$lte)(Ord_1.OrdNat, x, y), x, y);
};
exports.$min = $min;
const min = (x) => (y) => (0, exports.$min)(x, y);
exports.min = min;
// NOTE: Using native Math.min for efficiency.
const $$min = (x, y) => BigInt(Math.min(Number(x), Number(y)));
exports.$$min = $$min;
