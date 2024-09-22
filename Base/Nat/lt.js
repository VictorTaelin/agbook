"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lt = exports.$lt = exports.$$lt = void 0;
const Type_1 = require("../../Base/Bool/Type");
const $$lt = (x, y) => {
    if (x === 0n) {
        if (y === 0n) {
            return Type_1.False;
        }
        else {
            return Type_1.True;
        }
    }
    else {
        var x_ = x - 1n;
        if (y === 0n) {
            return Type_1.False;
        }
        else {
            var y_ = y - 1n;
            return (0, exports.$$lt)(x_, y_);
        }
    }
};
exports.$$lt = $$lt;
// NOTE: Using native BigInt comparison for efficiency
const $lt = (x, y) => x < y;
exports.$lt = $lt;
const lt = (x) => (y) => x < y;
exports.lt = lt;
// NOTE: Operator omitted: '_<_'
