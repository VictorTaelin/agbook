"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.$$max = exports.max = exports.$max = void 0;
const if_1 = require("../../Base/Bool/if");
const Ord_1 = require("../../Base/Nat/Trait/Ord");
const Ord_2 = require("../../Base/Trait/Ord");
// Returns the maximum of two natural numbers.
// - x: The first natural number.
// - y: The second natural number.
// = The larger of x and y.
const $max = (x, y) => {
    return (0, if_1.$if_then_else_)((0, Ord_2.$gte)(Ord_1.OrdNat, x, y), x, y);
};
exports.$max = $max;
const max = (x) => (y) => (0, exports.$max)(x, y);
exports.max = max;
// NOTE: Using native Math.max for efficiency.
const $$max = (x, y) => BigInt(Math.max(Number(x), Number(y)));
exports.$$max = $$max;
